require 'time'
class Offset

  attr_reader :key,
              :key_array,
              :converted_date,
              :offset_array,
              :rotation_array
  attr_accessor :date

  def initialize(key = 41521)
    @key = key
    # if @key == nil
    #   cracker
    # end
    @key_array = []
    @offset_array = []
    @rotation_array = []
    @date = Time.now
    runner
  end

  def runner
    building_key
    date_conversion
    cdate_offset(date_conversion)
    rotation_calculation
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
    @converted_date
  end

  def cdate_offset(converted_date)
    offset_data = converted_date.to_i
    offset_data = (offset_data ** 2).to_s
    length = offset_data.length
    @offset_array << offset_data[length - 4].to_i
    @offset_array << offset_data[length - 3].to_i
    @offset_array << offset_data[length - 2].to_i
    @offset_array << offset_data[length - 1].to_i
  end

  def rotation_calculation
    @offset_array.each_with_index do |position, i|
      @rotation_array << position + @key_array[i]
    end
    @rotation_array
  end




end
