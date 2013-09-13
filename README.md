== CEP

= Endereço

Para consultar endereço, pelo cep:

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
== Endereço

= CEP

Para consultar cep, pelo endereço:

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