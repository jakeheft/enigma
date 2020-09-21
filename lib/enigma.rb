class Enigma
  attr_reader :message, :key, :date
  
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @main_shift = Shift.new(@message, @key, @date)
  end
end
