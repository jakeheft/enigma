require "date"

class Enigma
  attr_reader :message, :key, :date, :encryption

  def initialize(message, key = generate_key, date = get_date)
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
    {encryption: @encryption, key: @key, date: @date}
  end

  def decrypt(message = @message, key = @key, date = @date)
    @main_shift.disperse_message
    @main_shift.run_decryption_shifts
    @encryption = @main_shift.compile_shifts
    @main_shift.reinsert_special_chars
    {decryption: @encryption, key: @key, date: @date}
  end

  def get_date
  date = DateTime.now
  date.strftime("%m%d%y")
  end
end
