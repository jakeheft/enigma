require './test/test_helper'

class CShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("12345", "091920")
    @c_shift = @main_shift.c_shift
  end

  def test_it_exists
    assert_instance_of CShift, @c_shift
  end

  def test_it_can_get_its_key_shift
    assert_equal "34", @c_shift.key_shift
  end

  def test_it_can_get_its_date_shift
    assert_equal "0", @c_shift.date_shift
  end

  def test_it_can_get_shift_value
    @main_shift.stubs(:generate_key).returns("12345")
    @main_shift.stubs(:date).returns("091920")

    assert_equal 34, @c_shift.shift_value
  end

  def test_it_can_get_shifted_alphabet
    expected = ["h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g"]

    assert_equal expected, @c_shift.shift_alphabet
    assert_equal expected, @c_shift.shifted_alpha
  end
end
