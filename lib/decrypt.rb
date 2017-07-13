require './lib/Enigma'

e = Enigma.new
if ARGV.length >= 4
  encrypted_file = ARGV[0]
  e_file = File.open(encrypted_file)
  txt = e_file.read()
  # puts txt
  e_file.close
  date_string = "20#{ARGV[3][4..5]}," # day
  date_string += "#{ARGV[3][0..1]},"
  date_string += "#{ARGV[3][2..3]}"

  cracked = e.decrypt(txt.chomp, "#{ARGV[2]}", Date.new(date_string), true)


  decrypted_file = ARGV[1]
  d_file = File.open(decrypted_file, "w")
  d_file.write(cracked)
  d_file.close
  date = e.date
  good_lookin = date.strftime("%m%d%y")
  a = e.a_ro
  b = e.b_ro
  c = e.c_ro
  d = e.d_ro
  puts "Created '#{ARGV[1]}' with the key [a = #{a}, b = #{b}, c = #{c} d = #{d}] and a date of #{good_lookin}"
else
  puts "Not enough arguments (4 minimum)"
end
