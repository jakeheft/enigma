class Shift
  attr_reader :alpha, :key

  def initialize(key = generate_key, date = "091920")
    @alpha = ("a".."z").to_a << " "
    @key = key
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end
end
