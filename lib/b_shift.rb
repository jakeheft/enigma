class BShift < Shift
  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
  end

  def key_shift
    @key[1..2]
  end
end
