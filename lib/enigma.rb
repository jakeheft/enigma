require "date"

class Enigma
  attr_reader :message, :key, :date, :encryption

  def initialize
    @key = nil
    @encryption = ""
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end

  def encrypt(message, key = generate_key, date = get_date)
    @key = key
    @main_shift = Shift.new(message, key, date)
    @main_shift.disperse_message
    @main_shift.run_shifts
    @encryption = @main_shift.compile_shifts
    @main_shift.reinsert_special_chars
    {encryption: @encryption, key: key, date: date}
  end

  def decrypt(message, key, date = get_date)
    @main_shift = Shift.new(message, key, date)
    @main_shift.disperse_message
    @main_shift.run_decryption_shifts
    @encryption = @main_shift.compile_shifts
    @main_shift.reinsert_special_chars
    {decryption: @encryption, key: key, date: date}
  end

  def get_date
  @date ||= (DateTime.now).strftime("%d%m%y")
  end
end
