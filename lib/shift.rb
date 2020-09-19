class Shift
  attr_reader :alpha, :key, :date
  ### FIGURE OUT HOW TO INCORPORATE TODAYS DATE
  def initialize(key = generate_key, date = "091920")
    @alpha = ("a".."z").to_a << " "
    @key = key
    @date = date
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end

  def date_shift
    date_squared = (@date.to_i ** 2).to_s
    @date_shift = (date_squared[-4..-1]).to_i
  end
end
