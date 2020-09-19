class AShift < Shift
  attr_reader :shifted_alpha

  def initialize(key, date_shift_all)
    @key = key
    @date_shift_all = date_shift_all
    @shifted_alpha = shift_alphabet
  end
  # does key_shift need to go in shift class and have each sub class pull from that method and input what parts it needs?
  def key_shift
    @key[0..1]
  end

  def date_shift
    @date_shift_all[0]
  end

  def shift_value
    key_shift.to_i + date_shift.to_i
  end

  def shift_alphabet
    (("a".."z").to_a << " ").rotate(shift_value)
  end
end
