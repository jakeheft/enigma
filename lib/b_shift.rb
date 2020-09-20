require_relative './shiftable'

class BShift < Shift
  include Shiftable
  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
  end

  def key_shift
    @key[1..2]
  end

  def date_shift
    @date_shift_all[1]
  end
end
