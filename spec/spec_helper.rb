require 'bundler/setup'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
