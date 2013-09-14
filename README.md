# CEP [![Build Status](https://secure.travis-ci.org/mjacobus/cep.png)](http://travis-ci.org/mjacobus/cep?branch=development)

Consultas ao CEP.

## Installation

Add this line to your application's Gemfile:

    gem 'juicy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install juicy

## Usage
### Para consultar endereço, pelo cep:

```ruby
Cep.new.cep("02045970")

# {
#    logradouro: "Rua Guajurus, 69",
#    bairro: "Jardim São Paulo(Zona Norte)",
#    localidade: "São Paulo",
#    estado: "SP",
#    cep: "02045970"
# }
```

### Para consultar cep, pelo endereço:

```ruby
Cep.new.address("Avenida Conde da Boa Vista Recife")

#[{:tipo_logradouro=>"Avenida",
#  :logradouro=>"Avenida Conde da Boa Vista - até 1016 - lado par",
#  :bairro=>"Boa Vista",
#  :localidade=>"Recife",
#  :uf=>"PE",
#  :cep=>"50060004"},
# {:tipo_logradouro=>"Avenida",
#  :logradouro=>"Avenida Conde da Boa Vista - até 1017 - lado ímpar",
#  :bairro=>"Boa Vista",
#  :localidade=>"Recife",
#  :uf=>"PE",
#  :cep=>"50060002"}]
```

## Contributors
- [Marcelo Jacobus](https://github.com/mjacobus)
- [Fernando Pereira](https://github.com/fernandopereira)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
