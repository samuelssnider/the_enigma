require './lib/Enigma'

e = Enigma.new
if ARGV.length >= 2
  message_file = ARGV[0]
  mes_file = File.open(message_file)
  txt = mes_file.read()
  # puts txt
  mes_file.close

  secret = e.encrypt(txt.chomp)


  coded_file = ARGV[1]
  c_file = File.open(coded_file, "w")
  c_file.write(secret)
  c_file.close
  date = e.date
  good_lookin = date.strftime("%m%d%y")
  a = e.a_ro
  b = e.b_ro
  c = e.c_ro
  d = e.d_ro
  puts "Created '#{ARGV[1]}' with the key [a = #{a}, b = #{b}, c = #{c} d = #{d}] and a date of #{good_lookin}"
else
  puts "Not enough arguments (2 minimum)"
end
