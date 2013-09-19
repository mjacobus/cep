module RuaBentoGoncalvesNovoHamburgoSearch
  def self.included(base)
    base.class_eval do
      let(:address_1) do
        {
          tipo_logradouro: 'Rua',
          logradouro: 'Rua Bento Gonçalves - até 999/1000',
          bairro: 'Centro',
          localidade: 'Novo Hamburgo',
          uf: 'RS',
          cep: '93410001'
        }
      end

      let(:address_2) do
        {
          tipo_logradouro: 'Rua',
          logradouro: 'Rua Bento Gonçalves - de 1001/1002 a 1699/1700',
          bairro: 'Centro',
          localidade: 'Novo Hamburgo',
          uf: 'RS',
          cep: '93410002'
        }
      end

      let(:address_3) do
        {
          tipo_logradouro: 'Rua',
          logradouro: 'Rua Bento Gonçalves - de 1701/1702 a 2099/2100',
          bairro: 'Centro',
          localidade: 'Novo Hamburgo',
          uf: 'RS',
          cep: '93410003'
        }
      end


      let(:address_4) do
        {
          tipo_logradouro: 'Rua',
          logradouro: 'Rua Bento Gonçalves - de 2101/2102 a 2499/2500',
          bairro: 'Centro',
          localidade: 'Novo Hamburgo',
          uf: 'RS',
          cep: '93510000'
        }
      end

      let(:address_5) do
        {
          logradouro: 'Rua Bento Gonçalves - de 2501/2502 a 2949/2950',
          bairro: 'Centro',
          localidade: 'Novo Hamburgo',
          uf: 'RS',
          cep: '93510001'
        }
      end

      let(:address_6) do
        {
          tipo_logradouro: 'Rua',
          logradouro: 'Rua Bento Gonçalves - de 2951/2952 ao fim',
          bairro: 'Centro',
          localidade: 'Novo Hamburgo',
          uf: 'RS',
          cep: '93520000'
        }
      end

      let(:address_7) do
        {
          tipo_logradouro: 'Rua',
          logradouro: 'Rua Bento Gonçalves, 2399',
          bairro: 'Centro',
          localidade: 'Novo Hamburgo',
          uf: 'RS',
          cep: '93510970',
          unidade: 'ACF Calçadão'
        }
      end

      let(:addresses) do
        [address_1, address_2 ,address_3, address_4, address_5, address_6, address_7]
      end

      let(:term) { 'Rua Bento Gonçalves Novo Hamburgo' }
    end
  end
end