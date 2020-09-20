require_relative './shiftable'

class DShift < Shift
  include Shiftable

  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
  end

  def key_shift
    @key[3..4]
  end
end
