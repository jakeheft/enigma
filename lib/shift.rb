class Shift
  attr_reader :alpha

  def initialize
    @alpha = ("a".."z").to_a << " "
  end
end
