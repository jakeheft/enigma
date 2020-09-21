class Enigma
  attr_reader :message, :key, :date, :encryption

  def initialize(message, key = generate_key, date)
    @message = message
    @key = key
    @date = date
    @main_shift = Shift.new(@message, @key)
    @encryption = @main_shift.ciphertext
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end

  def encrypt(message = @message, key = @key, date = @date)
    @main_shift.disperse_message
    @main_shift.run_shifts
    @encryption = @main_shift.compile_shifts
    @main_shift.reinsert_special_chars
    {encryption: @main_shift.ciphertext, key: @key, date: @date}
  end
end
