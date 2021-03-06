require './test/test_helper'

class DShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("hello world", "12345", "091920")
    @d_shift = @main_shift.d_shift
  end

  def test_it_exists
    assert_instance_of DShift, @d_shift
  end

  def test_it_can_get_its_key_shift
    assert_equal "45", @d_shift.key_shift
  end

  def test_it_can_get_its_date_shift
    assert_equal "0", @d_shift.date_shift
  end

  def test_it_can_get_shift_value
    @main_shift.stubs(:generate_key).returns("12345")
    @main_shift.stubs(:date).returns("091920")

    assert_equal 45, @d_shift.shift_value
  end

  def test_it_can_get_shifted_alphabet
    expected = ["s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d",
      "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"]

    assert_equal expected, @d_shift.shift_alphabet
    assert_equal expected, @d_shift.shifted_alpha
  end

  def test_it_can_get_shifted_alphabet
    expected =["j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
      "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i"]

    assert_equal expected, @d_shift.decrypt_shift_alphabet
    assert_equal expected, @d_shift.decrypt_shifted_alpha
  end

  def test_it_can_get_incoming_characters
    assert_equal [], @d_shift.incoming_chars

    @main_shift.disperse_message

    assert_equal [["l", 11], ["o", 14]], @d_shift.incoming_chars
  end

  def test_it_can_run_its_shift
    @main_shift.disperse_message

    assert_equal ["c", "f"], @d_shift.run_shift
    assert_equal ["c", "f"], @d_shift.outgoing_chars
  end

  def test_run_decrypt_shift
    main_shift = Shift.new("zescf cfilk", "12345", "091920")
    d_shift = main_shift.d_shift

    main_shift.disperse_message

    assert_equal [["c", 2], ["f", 5]], d_shift.incoming_chars
    assert_equal ["l", "o"], d_shift.run_decrypt_shift
    assert_equal ["l", "o"], d_shift.outgoing_chars
  end
end
