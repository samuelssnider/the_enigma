require './lib/Enigma'

e = Enigma.new
if ARGV.length >= 3
  secret_file = ARGV[0]
  s_file = File.open(secret_file)
  txt = s_file.read()
  # puts txt
  s_file.close
  year_string = "20#{ARGV[2][4..5]}," # day
  mon_string = "#{ARGV[2][0..1]},"
  day_string = "#{ARGV[2][2..3]}"

  secret = e.crack(txt.chomp, Date.new(year_string.to_i,mon_string.to_i,day_string.to_i))


  cracked_file = ARGV[1]
  c_file = File.open(cracked_file, "w")
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
  puts "Not enough arguments (3 minimum)"
end
