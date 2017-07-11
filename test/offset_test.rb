require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Offset'


class Code_Test <  Minitest::Test

  def setup
    @the_offset = Offset.new
  end

  def test_instance_of_Offset
    e = Offset.new
    refute_nil e
  end

  def test_key_exists
    e = Offset.new
    assert_equal e.key, 41521
    refute_nil e.key
  end

  def test_key_array_is_right
    e = Offset.new
    assert_equal e.key_array, [41, 15, 52, 21]
  end

  def test_Offset_initializes_date
    e = Offset.new
    assert_equal e.date.year, Time.now.year
    assert_equal e.date.month, Time.now.month
    assert_equal e.date.day, Time.now.day
  end

  def test_date_conversion
    e = Offset.new
    assert_equal e.converted_date, "110717"
  end

  def test_offset_value
    e = Offset.new
    assert_equal e.offset_array, [4,0,8,9]
  end

  def test_rotation_array_is_right
    e = Offset.new
    assert_equal e.rotation_array, [45, 15, 60, 30]
  end

end
