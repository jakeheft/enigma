require './test/test_helper'
require './lib/shift'
require './lib/a_shift'

class AShiftTest < Minitest::Test
  def test_it_exists
    main_shift = Shift.new("12345", "091920")
    a_shift = AShift.new("12345", "6400")

    assert_instance_of AShift, a_shift
  end

  def test_it_can_get_its_key_shift
    main_shift = Shift.new("12345", "091920")
    a_shift = AShift.new("12345", "6400")

    assert_equal "12", a_shift.key_shift
  end

  def test_it_can_get_its_date_shift
    main_shift = Shift.new("12345", "091920")
    a_shift = AShift.new("12345", "6400")

    assert_equal "6", a_shift.date_shift
  end

  def test_it_can_get_shift_value
    main_shift = Shift.new("12345", "091920")
    a_shift = AShift.new("12345", "6400")

    main_shift.stubs(:generate_key).returns("12345")
    main_shift.stubs(:date).returns("091920")

    assert_equal 18, a_shift.shift_value
  end

  def test_it_can_get_shifted_alphabet
    main_shift = Shift.new("12345", "091920")
    a_shift = AShift.new("12345", "6400")

    expected = ["s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"]
    assert_equal expected, a_shift.shifted_alpha
  end
end
