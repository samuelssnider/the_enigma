class Enigma
  def initialize(message, key = Keygen.new, date = Time.new)
    @message = message
    @key = key
    @date = date
  end


  def encrypt(@message, @key, @date)
  end
end
