class KeyGen
  attr_reader
            :gen_key
  def initialize
      generator
    end
  end

  def generator
    random_num = Random.new
    @gen_key = random_num.rand(89999) + 10000
    # @gen_key = Random.new(10000)
    # @gen_key.rand(10000..99999)
  end

  def gen_key
    @gen_key
  end

end
