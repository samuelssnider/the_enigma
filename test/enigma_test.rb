require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/Enigma'
require 'time'
require './lib/key_gen'

class Enigma_Test < Minitest:: Test

  def test_enigma_is_initialized_correctly
    e = Enigma.new
    refute_nil e
    assert_equal Fixnum, e.key.key_out.class
    # assert_equal Time.now, e.date
  end

  def test_decrypt_is_working
    e = Enigma.new
    e.decrypt("hey dude ..end..")
    assert_equal "deq1,u886.38jd32", e.decrypt("hey dude ..end..")
    assert_equal "deq1,u886.38jd326bd4io", e.decrypt("hey dude ..end.. blamo")
  end

  def test_visualizing_decrypt
    e = Enigma.new
    assert_equal "9a54 b65.c76,d87ae98bf 9", e.decrypt("aaaabbbbccccddddeeeeffff")
  end





end
