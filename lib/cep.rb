require 'net/http'
require 'nokogiri'
require 'addressable/uri'
require 'correios/address_search_response'

class Cep

  URL = 'http://m.correios.com.br/movel/buscaCepConfirma.do'

  def search(term)
    response = query({cepEntrada: term.parameterize(' '), metodo: :buscarCep})
    Correios::AddressSearchResponse.new(response.body).addresses
  end
  alias_method :address, :search

  def cep(cep)
    search(cep)[0]
  end

  def url(params = {})
    uri = Addressable::URI.new
    uri.query_values = params
    url = "#{Cep::URL}?#{uri.query}"
  end

  def query(params = {})
    uri = URI(URL)
    Net::HTTP.post_form(uri, params)
  end
end