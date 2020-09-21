class Enigma
  attr_reader :message, :key, :date

  def initialize(key = generate_key)#, message, date)
    @message = message
    @key = key
    @date = date
    @main_shift = Shift.new(@message)
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end
end
