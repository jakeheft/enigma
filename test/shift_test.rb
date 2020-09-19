require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test
  def test_it_exists
    main_shift = Shift.new
  end

  def test_it_has_an_alphabet_that_can_be_called_on
    main_shift = Shift.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, main_shift.alpha
    assert_equal "j", main_shift.alpha[9]
    assert_equal " ", main_shift.alpha[26]
    assert_nil main_shift.alpha[28]
  end
end
