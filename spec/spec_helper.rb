require "bundler/setup"
require "rocket_api"

RSpec.configure do |config|
  config.example_status_persistance_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end