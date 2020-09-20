class Shift
  attr_reader :alpha, :message, :key, :date, :a_shift, :b_shift, :c_shift, :d_shift
  ### FIGURE OUT HOW TO INCORPORATE TODAYS DATE
  def initialize(message, key = generate_key, date = "091920")
    @alpha = ("a".."z").to_a << " "
    @message = message
    @key = key
    @date = date
    @a_shift = AShift.new(@key, date_shift_all)
    @b_shift = BShift.new(@key, date_shift_all)
    @c_shift = CShift.new(@key, date_shift_all)
    @d_shift = DShift.new(@key, date_shift_all)
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end

  def date_shift_all
    date_squared = (@date.to_i ** 2).to_s
    @date_shift = (date_squared[-4..-1])
  end
  ### before dispersing, need to check for special characters, document position and then remove them. Build this as a helper method, then call that method inside disperse_message

  def char_values
    separated_characters = @message.chars
    test = separated_characters.map do |character|
      [character] << @alpha.find_index(character)
    end
  end

  def disperse_message
    chars_with_values = char_values
    until chars_with_values.empty?
      (@a_shift.incoming_chars << chars_with_values.shift).compact!
      (@b_shift.incoming_chars << chars_with_values.shift).compact!
      (@c_shift.incoming_chars << chars_with_values.shift).compact!
      (@d_shift.incoming_chars << chars_with_values.shift).compact!
    end
  end
end
