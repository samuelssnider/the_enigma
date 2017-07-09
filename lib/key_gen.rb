class KeyGen

  attr_reader :gen_key

  def initialize
    @gen_key = gen_key

  
  def generator
    gen_key = Random.new(10000)
    gen_key.rand(10000...99999)
  end
