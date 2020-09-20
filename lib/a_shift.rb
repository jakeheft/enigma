require_relative './shiftable'

class AShift < Shift
  include Shiftable
  attr_reader :shifted_alpha

  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
    @shifted_alpha = shift_alphabet
  end

  def key_shift
    @key[0..1]
  end

  def date_shift
    @date_shift_all[0]
  end
end
