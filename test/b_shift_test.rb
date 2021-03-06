require './test/test_helper'

class BShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("hello world", "12345", "091920")
    @b_shift = @main_shift.b_shift
  end

  def test_it_exists
    assert_instance_of BShift, @b_shift
  end

  def test_it_can_get_its_key_shift
    assert_equal "23", @b_shift.key_shift
  end

  def test_it_can_get_its_date_shift
    assert_equal "4", @b_shift.date_shift
  end

  def test_it_can_get_shift_value
    @main_shift.stubs(:generate_key).returns("12345")
    @main_shift.stubs(:date).returns("091920")

    assert_equal 27, @b_shift.shift_value
  end

  def test_it_can_get_shifted_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
      "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @b_shift.shift_alphabet
    assert_equal expected, @b_shift.shifted_alpha
  end

  def test_it_can_get_decrypted_shifted_alphabet
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
      "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @b_shift.decrypt_shift_alphabet
    assert_equal expected, @b_shift.decrypt_shifted_alpha
  end

  def test_it_can_get_incoming_characters
    assert_equal [], @b_shift.incoming_chars

    @main_shift.disperse_message

    assert_equal [["e", 4], [" ", 26], ["l", 11]], @b_shift.incoming_chars
  end

  def test_it_can_run_its_shift
    @main_shift.disperse_message

    assert_equal ["e", " ", "l"], @b_shift.run_shift
    assert_equal ["e", " ", "l"], @b_shift.outgoing_chars
  end

  def test_run_decrypt_shift
    main_shift = Shift.new("zescf cfilk", "12345", "091920")
    b_shift = main_shift.b_shift

    main_shift.disperse_message

    assert_equal [["e", 4], [" ", 26], ["l", 11]], b_shift.incoming_chars
    assert_equal ["e", " ", "l"], b_shift.run_decrypt_shift
    assert_equal ["e", " ", "l"], b_shift.outgoing_chars
  end
end
