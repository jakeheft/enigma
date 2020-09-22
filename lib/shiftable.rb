module Shiftable
  def shift_value
    (key_shift.to_i + date_shift.to_i)
  end

  def shift_alphabet
    (("a".."z").to_a << " ").rotate(shift_value)
  end

  def decrypt_shift_alphabet
    (("a".."z").to_a << " ").rotate(shift_value.-@)
  end

  def run_shift
    @outgoing_chars = @incoming_chars.map { |char| @shifted_alpha[char[1]] }
  end

  def run_decrypt_shift
    @outgoing_chars = @incoming_chars.map { |char| @decrypt_shifted_alpha[char[1]] }
  end
end
