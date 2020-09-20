require_relative './shiftable'

class BShift < Shift
  include Shiftable
  attr_reader :shifted_alpha, :incoming_chars

  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
    @shifted_alpha = shift_alphabet
    @incoming_chars = []
  end

  def key_shift
    @key[1..2]
  end

  def date_shift
    @date_shift_all[1]
  end
end
