require 'coveralls'
Coveralls.wear!

require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  Dir["#{File.realpath('.')}/spec/support/**/*.rb"].each { |f| load f }
end

def response_fixture(name)
  path = File.realpath("spec/fixtures/responses/#{name}.html")
  File.read(path)
end
