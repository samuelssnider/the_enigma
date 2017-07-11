require 'pry'
require 'time'
require './lib/offset'
class Enigma
  attr_reader :offset,
              :date,
              :message,
              :decrypted,
              :key_ary


  def initialize(date = Time.now)
    @offset = Offset.new
    @date = date
    @key_ary = []
    @rotation = @offset.rotation_array
    @rotation
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




  # def encrypt(@message, @key, @date)
  # end


  def decrypt(message, key = @key, date = @date)
    @offset = Offset.new(key)
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
    @offset.date = date
    @offset.offset_array
    length = secret_msg.length
    cracker_string = secret_msg[(length - 4)..(length - 1)]
    if (length % 4) == 0
      a_key = key_calculation(cracker_string[0], "n", @offset.offset_array[0])
      b_key = key_calculation(cracker_string[1], "d", @offset.offset_array[1])
      c_key = key_calculation(cracker_string[2], ".", @offset.offset_array[2])
      d_key = key_calculation(cracker_string[3], ".", @offset.offset_array[3])
    elsif (length % 4) == 1
      b_key = key_calculation(cracker_string[0], "n", @offset.offset_array[1])
      c_key = key_calculation(cracker_string[1], "d", @offset.offset_array[2])
      d_key = key_calculation(cracker_string[2], ".", @offset.offset_array[3])
      a_key = key_calculation(cracker_string[3], ".", @offset.offset_array[0])
    elsif (length % 4) == 2
      c_key = key_calculation(cracker_string[0], "n", @offset.offset_array[2])
      d_key = key_calculation(cracker_string[1], "d", @offset.offset_array[3])
      a_key = key_calculation(cracker_string[2], ".", @offset.offset_array[0])
      b_key = key_calculation(cracker_string[3], ".", @offset.offset_array[1])
    else(length % 4) == 3
      d_key = key_calculation(cracker_string[0], "n", @offset.offset_array[3])
      a_key = key_calculation(cracker_string[1], "d", @offset.offset_array[0])
      b_key = key_calculation(cracker_string[2], ".", @offset.offset_array[1])
      c_key = key_calculation(cracker_string[3], ".", @offset.offset_array[2])
    end
    # a_key_diff = @key_map.find_index(cracker_string[0]) - @key_map.find_index("n")
    # a_key = a_key_diff - @offset.offset_array[0]
    # b_key_diff = @key_map.find_index(cracker_string[1]) - @key_map.find_index("d")
    # b_key = b_key_diff - @offset.offset_array[1]
    # c_key_diff = @key_map.find_index(cracker_string[2]) - @key_map.find_index(".")
    # c_key = c_key_diff - @offset.offset_array[2]
    # d_key_diff = @key_map.find_index(cracker_string[3]) - @key_map.find_index(".")
    # d_key = d_key_diff - @offset.offset_array[3]
    @key_ary << a_key
    @key_ary << b_key
    @key_ary << c_key
    @key_ary << d_key
    # decrypt(secret_msg, @key_ary)
    @key_ary
    key = (a_key.to_s + (b_key % 10).to_s + (c_key % 10).to_s + (d_key % 10).to_s)
    decrypt(secret_msg)
  end

  def key_calculation(coded_char, known_char, offset)
    key_diff = @key_map.find_index(coded_char) - @key_map.find_index(known_char)
    key = key_diff - offset
    key %= 39
    if key < 0
      key += 39
    end
    key
  end


  # a_wo_key = @key_map.find_index(cracker_string[0]) - @offset.offset_array[0]
  # a_key = @key_map.find_index("n") - a_wo_key
  # b_wo_key = @key_map.find_index(cracker_string[1]) - @offset.offset_array[1]
  # b_key = @key_map.find_index("d") - b_wo_key
  # c_wo_key = @key_map.find_index(cracker_string[2]) - @offset.offset_array[2]
  # c_key = @key_map.find_index(".") - c_wo_key
  # d_wo_key = @key_map.find_index(cracker_string[3]) - @offset.offset_array[3]
  # d_key = @key_map.find_index(".") - d_wo_key



end
  write = File.new(ARGV[1], "w"){
  write << File.open(ARGV[0], "w"){|file| write.encrpty(ARGV[0].readlines)}
  }

  # writer = ARGV[1]
  # encrypted = File.new("./data/#{writer}", "w"){
  # begin
  #   reader = ARGV[2]
  #   reader = File.open("./data/message.txt", "r")
  # rescue => err_mes
  #   puts err_mes
  # end
  # write.puts(decrypt(reader.read()))
  # write.close
  # reader.close
  # }
