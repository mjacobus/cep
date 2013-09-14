Gem::Specification.new do |s|
  s.name        = 'cep'
  s.version     = '0.0.1'
  s.date        = '2013-03-04'
  s.summary     = "API for getting address of a given CEP"
  s.description = "API for getting address of a given CEP"
  s.authors     = ["Marcelo Jacobus"]
  s.email       = 'marcelo.jacobus@gmail.com'
  s.files       = ["lib/cep.rb"]
  s.homepage    = 'https://github.com/mjacobus/cep.git'


  s.add_dependency "nokogiri"
  s.add_dependency "addressable"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end