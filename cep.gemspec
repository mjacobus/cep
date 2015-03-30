$:.push File.expand_path('../lib', __FILE__)

require 'cep/version'

Gem::Specification.new do |s|
  s.name        = 'cep'
  s.version     = Cep::VERSION
  s.date        = '2013-09-20'
  s.summary     = "API for getting address of a given CEP or ADDRESS"
  s.description = "API for getting address of a given CEP or ADDRESS"
  s.authors     = ["Marcelo Jacobus","Fernando Pereira"]
  s.email       = ['marcelo.jacobus@gmail.com', '']
  s.files       = ["lib/cep.rb"]
  s.homepage    = 'https://github.com/mjacobus/cep.git'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 1.9.3'
  s.add_dependency "nokogiri"
  s.add_dependency "addressable"
  s.add_dependency "activesupport"
  s.add_dependency "i18n"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "coveralls"
end
