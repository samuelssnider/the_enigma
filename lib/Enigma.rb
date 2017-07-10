require 'pry'
require 'time'
require './lib/offset'
class Enigma
  attr_reader :key,
              :date,
              :message,
              :decrypted,
              :key_ary

  def initialize(key = KeyGen.new, date = Time.now)
    @offset = Offset.new(key)
    @key = key
    @date = date
    @key_ary = []
    @rotation = @offset.rotation_array
    @a_ro = @rotation[0] % 39
    @b_ro = @rotation[1] % 39
    @c_ro = @rotation[2] % 39
    @d_ro = @rotation[3] % 39
    @decrypted = ''
    @key_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
               'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
               'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
               'y', 'z', '0', '1' ,'2', '3', '4', '5',
               '6', '7', '8', '9', ' ', '.', ',']
  end

  def message
    @message
  end

  def decrypted
    @decrypted
  end




  # def encrypt(@message, @key, @date)
  # end


  def decrypt(message, key =@key, date = @date)
    @decrypted = message
    length = message.length
    counter = 0
    while counter < message.length
      @decrypted[counter] = rvs_rotate(message[counter], @a_ro)
      counter += 4
    end
    counter = 1
    while counter < message.length
      @decrypted[counter] = rvs_rotate(message[counter], @b_ro)
      counter += 4
    end
    counter = 2
    while counter < message.length
      @decrypted[counter] = rvs_rotate(message[counter], @c_ro)
      counter += 4
    end
    counter = 3
    while counter < message.length
      @decrypted[counter] = rvs_rotate(message[counter], @d_ro)
      counter += 4
    end
    @decrypted
  end



  def rvs_rotate(char, key)
    index = @key_map.find_index(char)
    @key_map[index - key]
  end

  def crack(secret_msg, date = Time.now)
    @offset.offset_array
    length = secret_msg.length
    cracker_string = secret_msg[(length - 4)..(length - 1)]
    a_wo_key = @key_map.find_index(cracker_string[0]) - @offset.offset_array[0]
    a_key = @key_map.find_index("n") - a_wo_key
    b_wo_key = @key_map.find_index(cracker_string[1]) - @offset.offset_array[1]
    b_key = @key_map.find_index("d") - b_wo_key
    c_wo_key = @key_map.find_index(cracker_string[2]) - @offset.offset_array[2]
    c_key = @key_map.find_index(".") - c_wo_key
    d_wo_key = @key_map.find_index(cracker_string[3]) - @offset.offset_array[3]
    d_key = @key_map.find_index(".") - d_wo_key
    @key_ary << a_key
    @key_ary << b_key
    @key_ary << c_key
    @key_ary << d_key
  end



end
