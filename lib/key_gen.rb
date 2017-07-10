class KeyGen
  attr_reader :key_out

  def initialize
      @key_out
      generator
  end

  def generator
    random_num = Random.new
    @key_out = random_num.rand(10000...99999)
    # @gen_key = Random.new(10000)
    #gen_key.rand(10000..99999)
  end

  # def key_out
  #   @key_out
  # end

end
