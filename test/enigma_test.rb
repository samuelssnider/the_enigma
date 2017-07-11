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
    assert_equal Fixnum, e.offset.key.class
    # assert_equal Time.now, e.date
  end

  def test_decrypt_is_working
    e = Enigma.new
    e.decrypt("hey dude ..end..")
    assert_equal "b2dg fvn4wqnh1qh", e.decrypt("hey dude ..end..")
    assert_equal "b2dg fvn4wqnh1qh4z3jg,", e.decrypt("hey dude ..end.. blamo")
  end

  def test_visualizing_decrypt
    e = Enigma.new
    assert_equal "7ysj8ztk90ul 1vm.2wn,3xo", e.decrypt("aaaabbbbccccddddeeeeffff")
  end

  def test_crack_is_working
    skip
    e = Enigma.new
    assert_equal "hey", e.crack("a82ab")
  end





end
