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
    e = Enigma.new(Offset.new(41521))
    e.decrypt("hey dude ..end..")
    assert_equal "b2dg fvn4wqnh1qh", e.decrypt("hey dude ..end..")
    assert_equal "8..end..", e.decrypt("bnt8tst2")
  end

  def test_visualizing_decrypt
    e = Enigma.new(Offset.new(41521))
    assert_equal "7ysj8ztk90ul 1vm.2wn,3xo", e.decrypt("aaaabbbbccccddddeeeeffff")
  end

  def test_crack_is_working
    e = Enigma.new
    assert_equal "8..end..", e.crack("bnt8tst2")
    assert_equal "28..end..", e.crack("8kt2k2y2e")
    assert_equal "128..end..", e.crack("7eq2et87en")
    assert_equal "7128..end..", e.crack("adkzenzejnt")
    # assert_equal "fdasdfdskkaf", e.crack("faasmsladfkl")
  end

  def test_encrypt_is_working
    e = Enigma.new(Offset.new(41521))
    assert_equal "bnt8tst2", e.encrypt("8..end..")
    assert_equal "8kt2k2y2e" , e.encrypt("28..end..")
    assert_equal "7eq2et87en", e.encrypt("128..end..")
    assert_equal "adkzenzejnt", e.encrypt("7128..end..")
  end





end
