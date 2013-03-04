== CEP

= Endereço

Para consultar endereço, pelo cep:

```ruby
Cep.new.address("02045970")

# {
#    logradouro: "Rua Guajurus, 69",
#    bairro: "Jardim São Paulo(Zona Norte)",
#    localidade: "São Paulo",
#    estado: "SP",
#    cep: "02045970"
# }
```
