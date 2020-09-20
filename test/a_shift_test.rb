require './test/test_helper'

class AShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("hello world", "12345", "091920")
    @a_shift = @main_shift.a_shift
  end

  def test_it_exists
    assert_instance_of AShift, @a_shift
  end

  def test_it_can_get_its_key_shift
    assert_equal "12", @a_shift.key_shift
  end

  def test_it_can_get_its_date_shift
    assert_equal "6", @a_shift.date_shift
  end

  def test_it_can_get_shift_value
    @main_shift.stubs(:generate_key).returns("12345")
    @main_shift.stubs(:date).returns("091920")

    assert_equal 18, @a_shift.shift_value
  end

  def test_it_can_get_shifted_alphabet
    expected = ["s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"]

    assert_equal expected, @a_shift.shift_alphabet
    assert_equal expected, @a_shift.shifted_alpha
  end

  def test_it_can_get_incoming_characters
    assert_equal [], @a_shift.incoming_chars

    @main_shift.disperse_message

    assert_equal [["h", 7], ["o", 14], ["r", 17]], @a_shift.incoming_chars
  end

  def test_it_can_run_its_shift
    @main_shift.disperse_message
    
    assert_equal ["z", "f", "i"], @a_shift.run_shift
  end
end
