require "test_helper"
require 'dicemypass'

class DicemypassTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Dicemypass::VERSION
  end

  def test_say_hi
    assert_equal Dicemypass.say_hi('Keelana'), 'Hello, Keelana!'
  end
end
