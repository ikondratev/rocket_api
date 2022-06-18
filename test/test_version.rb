require 'minitest/autorun'
require 'rocket_api/version'

class TestVersion < Minitest::Test
  include RocketApi
  def test_ping
    assert_equal("0.0.1.6", RocketApi::VERSION)
  end
end