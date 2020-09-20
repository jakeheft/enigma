class Shift
  attr_reader :alpha, :message, :key, :date, :a_shift, :b_shift, :c_shift, :d_shift
  ### FIGURE OUT HOW TO INCORPORATE TODAYS DATE
  def initialize(message, key = generate_key, date = "091920")
    @alpha = ("a".."z").to_a << " "
    @message = message
    @key = key
    @date = date
    @a_shift = AShift.new(@key, date_shift_all)
    @b_shift = BShift.new(@key, date_shift_all)
    @c_shift = CShift.new(@key, date_shift_all)
    @d_shift = DShift.new(@key, date_shift_all)
  end

  def generate_key
    @key ||= "%05d" % rand(100000)
  end

  def date_shift_all
    date_squared = (@date.to_i ** 2).to_s
    @date_shift = (date_squared[-4..-1])
  end
end
