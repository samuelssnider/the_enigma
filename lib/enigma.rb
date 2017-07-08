require 'date'
class Enigma

  attr_reader :key, :key_array, :date, :converted_date

  def initialize
    @key = 41521
    @key_array = []
    @offset_array = []
    @rotation_array = []
    building_key
    @date = Date.new(2017,7,8)
    @converted_date
    date_conversion


  end

  def building_key
    #refactor/combine
    key_string = @key.to_s
    @key_array << key_string[0..1].to_i
    @key_array << key_string[1..2].to_i
    @key_array << key_string[2..3].to_i
    @key_array << key_string[3..4].to_i
  end

  def date_conversion
    @converted_date = @date.day.to_s.rjust(2,'0')
    @converted_date += @date.month.to_s.rjust(2,'0')
    @converted_date += @date.year.to_s[2..3]
  end

  def cdate_offset
    offset_string = @converted_date.to_i
  end




end
