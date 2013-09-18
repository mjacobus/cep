require 'net/http'
require 'nokogiri'
require 'addressable/uri'

class Cep

  URL = 'http://m.correios.com.br/movel/buscaCepConfirma.do'

  def initialize
    @ceps = []
    @_cep = {}
  end

  def address(cep)
    response = query({cepEntrada: cep, metodo: :buscarCep})
    values = values(response)
  end

  def cep(cep)
    address(cep)[0]
  end

  def url(params = {})
    uri = Addressable::URI.new
    uri.query_values = params
    url = "#{Cep::URL}?#{uri.query}"
  end

  def query(params = {})
    uri = URI.parse(url(params))
    Net::HTTP.get_response(uri)
  end

  def values(response)
    Nokogiri::HTML(response.body).css('.respostadestaque').each do |el|
      el.parent.children.children.each_slice(2).each do |k,v|
        elements = clean_element(k, v)
        handle_keys(elements)
      end 
    end
    @ceps.uniq
  end

  private

  def clean_element(key, value)
    key = resolve_text(key.text).gsub(/:/,'').downcase unless key.nil?
    value = resolve_text(value.text) unless value.nil?
    [key, value]
  end

  def resolve_text(text)
    text.gsub(/[\n\t]/,'').gsub(/\s+/,' ').strip
  end

  def handle_keys(elements)
    key = elements[0]
    value = elements[1]
    unless key == 'opções' and value == nil
      add_cep_in_ceps(key)
      resolve_adrress(key, value)
      resolve_locality(key, value)
      resolve_others(key, value)
    end
  end

  def add_cep_in_ceps(key)
    if key_name_present?(key, ['logradouro','endereço'])
      @ceps << @_cep unless @_cep.empty?
      @_cep = {}
    end
    @ceps
  end

  def resolve_adrress(key, value)
    if key_name_present?(key, ['logradouro','endereço'])
      @ceps << @_cep unless @_cep.empty?
      @_cep[:tipo_logradouro] = value.split(' ').map{|v| v.strip}[0]
      @_cep[:logradouro] = value
    end
    @_cep
  end

  def resolve_locality(key, value)
    if key_name_present?(key, ['localidade / uf'])
      @ceps << @_cep unless @_cep.empty?
      @_cep[locality(key,0).to_sym] = locality(value,0)
      @_cep[locality(key,1).to_sym] = locality(value,1)
    end
    @_cep
  end

  def resolve_others(key, value)
    unless key_name_present?(key, ['logradouro','endereço','localidade / uf'])
      @ceps << @_cep unless @_cep.empty?
      @_cep[key.to_sym] = value
    end
    @_cep
  end

  def locality(el, pos)
    el.split('/').map{|v| v.strip}[pos]
  end

  def key_name_present?(key, names=[])
    names.include?(key)
  end
end