# encoding: UTF-8
module RuaBentoGoncalvesNovoHamburgoSearch
  def self.included(base)
    base.class_eval do
      let(:address_1) do
        {
          :tipo_logradouro=>"Rua", 
          :logradouro=>"Rua Bento Gonçalves - até 999/1000", 
          :bairro=>"Centro", 
          :localidade=>"Novo Hamburgo", 
          :uf=>"RS", 
          :cep=>"93410001"
        }
      end

      let(:address_2) do
        {
          :tipo_logradouro=>"Rua", 
          :logradouro=>"Rua Bento Gonçalves - de 1001/1002 a 1699/1700", 
          :bairro=>"Centro", 
          :localidade=>"Novo Hamburgo", 
          :uf=>"RS", 
          :cep=>"93410002"
        }
      end

      let(:addresses) do
        [address_1, address_2]
      end

      let(:term) { 'Rua Bento Gonçalves Novo Hamburgo' }
    end
  end
end
