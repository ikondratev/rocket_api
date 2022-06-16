require 'minitest/autorun'
require 'rocket_api'

class TestPing < Minitest::Test
  include RocketApi
  def test_ping
    assert_equal("PONG", ping)
  end
end