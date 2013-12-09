# CEP

Consultas ao CEP.

[![Build Status](https://secure.travis-ci.org/mjacobus/cep.png)](http://travis-ci.org/mjacobus/cep?branch=development)
[![Coverage Status](https://coveralls.io/repos/mjacobus/cep/badge.png)](https://coveralls.io/r/mjacobus/cep)
[![Gem Version](https://badge.fury.io/rb/cep.png)](http://badge.fury.io/rb/cep)
[![Dependency Status](https://gemnasium.com/mjacobus/cep.png)](https://gemnasium.com/mjacobus/cep)

## Installation

Add this line to your application's Gemfile:

    gem 'cep'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cep

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
