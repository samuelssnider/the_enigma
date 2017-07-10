require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_gen'


class KeyGen_Test < Minitest::Test

  def test_key_exists
    kg = KeyGen.new
    refute_nil kg
    assert_equal Fixnum, kg.key_out.class
  end
end
