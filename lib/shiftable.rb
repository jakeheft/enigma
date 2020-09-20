module Shiftable
  def shift_value
    key_shift.to_i + date_shift.to_i
  end

  def shift_alphabet
    (("a".."z").to_a << " ").rotate(shift_value)
  end

  def run_shift
    @incoming_chars.map { |char| @shifted_alpha[char[1]] }
  end
end
