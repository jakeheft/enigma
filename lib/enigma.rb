class Enigma
  attr_reader :message, :key, :date

  def initialize(message, key = generate_key)# date)
    @message = message
    @key = key
    @date = date
    require "pry"; binding.pry
    @main_shift = Shift.new(@message, @key)
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end
end
