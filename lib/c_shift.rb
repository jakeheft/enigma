require_relative './shiftable'

class CShift < Shift
  include Shiftable

  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
  end

end
