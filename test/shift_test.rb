require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test
  def test_it_exists
    main_shift = Shift.new

    assert_instance_of Shift, main_shift
  end

  def test_it_has_an_alphabet_that_can_be_called_on
    main_shift = Shift.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, main_shift.alpha
    assert_equal "j", main_shift.alpha[9]
    assert_equal " ", main_shift.alpha[26]
    assert_nil main_shift.alpha[28]
  end

  def test_it_can_generate_a_5_digit_key_that_will_not_change
    main_shift = Shift.new
    expected = main_shift.key

    assert_equal 5, main_shift.key.length

    main_shift.generate_key

    assert_equal expected, main_shift.key
  end
### PUT IN A TEST FOR PULLING THE DATE WHEN YOU'VE FIGURED IT OUT
  def test_it_can_get_the_date_for_the_shift
    main_shift = Shift.new

    assert_equal 6, main_shift.date.length

    main_shift.stubs(:date).returns("091920")
    assert_equal "6400", main_shift.date_shift
  end
end
