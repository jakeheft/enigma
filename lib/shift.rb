class Shift
  attr_reader :alpha, :special_chars, :message, :key, :date, :a_shift, :b_shift, :c_shift, :d_shift, :ciphertext
  def initialize(message, key, date)
    @alpha = ("a".."z").to_a << " "
    @special_chars = []
    @message = message
    @key = key
    @date = date
    @a_shift = AShift.new(@key, date_shift_all)
    @b_shift = BShift.new(@key, date_shift_all)
    @c_shift = CShift.new(@key, date_shift_all)
    @d_shift = DShift.new(@key, date_shift_all)
    @char_counter = 0
    @ciphertext = ""
  end

  def date_shift_all
    date_squared = (@date.to_i ** 2).to_s
    @date_shift = (date_squared[-4..-1])
  end

  def stash_special_chars
    @message.chars.each do |char|
      if !@alpha.include?(char)
        @special_chars << [char, @message.index(char)]
      end
    end
    @message.chars.select { |char| @alpha.include?(char) }
  end

  def char_values
    stash_special_chars.map do |char|
      [char] << @alpha.find_index(char)
    end
  end

  def disperse_message
    chars_with_values = char_values
    until chars_with_values.empty?
      (@a_shift.incoming_chars << chars_with_values.shift).compact!
      (@b_shift.incoming_chars << chars_with_values.shift).compact!
      (@c_shift.incoming_chars << chars_with_values.shift).compact!
      (@d_shift.incoming_chars << chars_with_values.shift).compact!
      @char_counter += 1
    end
  end

  def run_shifts
   [@a_shift, @b_shift, @c_shift, @d_shift].each do |shift|
     shift.run_shift
   end
 end

  def compile_shifts
    shifted_chars = []
    @char_counter.times do
      shifted_chars << @a_shift.outgoing_chars.shift
      shifted_chars << @b_shift.outgoing_chars.shift
      shifted_chars << @c_shift.outgoing_chars.shift
      shifted_chars << @d_shift.outgoing_chars.shift
    end
    @ciphertext = shifted_chars.compact.join
  end

  def reinsert_special_chars
    @special_chars.each do |char|
      @ciphertext.insert(char[1], char[0])
    end
  end

  def run_decryption_shifts
    [@a_shift, @b_shift, @c_shift, @d_shift].each do |shift|
      shift.run_decrypt_shift
    end
  end
end
