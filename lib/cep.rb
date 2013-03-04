require 'net/http'
require 'nokogiri'
require 'addressable/uri'

class Cep

  URL = 'http://m.correios.com.br/movel/buscaCepConfirma.do'

  def address(cep)
    response = query({cepEntrada: cep, metodo: :buscarCep})
    values = values(response)

    city_and_state = values[2].split('/').map{|v| v.strip}

    {
      logradouro: values[0],
      bairro: values[1],
      localidade: city_and_state[0],
      estado: city_and_state[1],
      cep: values[3]
    }
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
    Nokogiri::HTML(response.body).css('.respostadestaque').map do |el|
      el.content.gsub(/[\n\t]/,'').strip.gsub(/\s+/,' ')
    end
  end


end