require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'


class Code_Test <  Minitest::Test

  def test_instance_of_Enigma
    e = Enigma.new
    refute_nil e
  end

  def test_key_exists
    e = Enigma.new
    assert_equal e.key, 41521
    refute_nil e.key
  end

  def test_key_array_is_right
    e = Enigma.new
    assert_equal e.key_array, [41, 15, 52, 21]
  end

  def test_enigma_initializes_date
    e = Enigma.new
    assert_equal e.date.year, 2017
    assert_equal e.date.month,7
    assert_equal e.date.day, 8
  end

  def test_date_conversion
    e = Enigma.new
    assert_equal e.converted_date, "080717"
  end

  def test_offset_value
    e = Enigma.new
    assert_equal e.offset_array, [4,0,8,9]
  end

end  
