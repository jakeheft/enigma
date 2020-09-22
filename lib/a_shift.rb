require_relative './shiftable'

class AShift < Shift
  include Shiftable
  attr_reader :shifted_alpha, :decrypt_shifted_alpha, :incoming_chars, :outgoing_chars

  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
    @shifted_alpha = shift_alphabet
    @decrypt_shifted_alpha = decrypt_shift_alphabet
    @incoming_chars = []
    @outgoing_chars = [] ### keep an eye on this - will map turn this into an array inside an array?
  end

  def key_shift
    @key[0..1]
  end

  def date_shift
    @date_shift_all[0]
  end
end
