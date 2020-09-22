require './test/test_helper'

class ShiftTest < Minitest::Test
  def test_it_exists
    main_shift = Shift.new("hello world", "12345", "091920")

    assert_instance_of Shift, main_shift
  end

  def test_it_instantiates_each_shift_letter_object
    main_shift = Shift.new("hello world", "12345", "091920")

    assert_instance_of AShift, main_shift.a_shift
    assert_instance_of BShift, main_shift.b_shift
    assert_instance_of CShift, main_shift.c_shift
    assert_instance_of DShift, main_shift.d_shift
  end

  def test_it_has_an_alphabet_that_can_be_called_on
    main_shift = Shift.new("hello world", "12345", "091920")

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
      "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, main_shift.alpha
    assert_equal "j", main_shift.alpha[9]
    assert_equal " ", main_shift.alpha[26]
    assert_nil main_shift.alpha[28]
  end

  def test_it_has_a_message
    main_shift = Shift.new("hello world", "12345", "091920")

    assert_equal "hello world", main_shift.message
  end

  def test_it_can_get_the_date_for_the_shift
    main_shift = Shift.new("hello world", "12345", "091920")

    assert_equal 6, main_shift.date.length

    main_shift.stubs(:date).returns("091920")
    assert_equal "6400", main_shift.date_shift_all
  end
  
  def test_it_can_pair_characters_with_values
    main_shift = Shift.new("hello world", "12345", "091920")

    expected = ["h", 7]
    assert_equal expected, main_shift.char_values[0]
  end

  def test_it_can_route_a_string_to_proper_shift_subclasses
    main_shift = Shift.new("hello world", "12345", "091920")

    main_shift.disperse_message

    assert_equal [["h", 7], ["o", 14], ["r", 17]], main_shift.a_shift.incoming_chars
    assert_equal [["e", 4], [" ", 26], ["l", 11]], main_shift.b_shift.incoming_chars
    assert_equal [["l", 11], ["w", 22], ["d", 3]], main_shift.c_shift.incoming_chars
    assert_equal [["l", 11], ["o", 14]], main_shift.d_shift.incoming_chars
  end

  def test_it_can_run_all_shifts
    main_shift = Shift.new("hello world", "12345", "091920")

    main_shift.disperse_message
    main_shift.run_shifts

    assert_equal ["z", "f", "i"], main_shift.a_shift.outgoing_chars
    assert_equal ["e", " ", "l"], main_shift.b_shift.outgoing_chars
    assert_equal ["s", "c", "k"], main_shift.c_shift.outgoing_chars
    assert_equal ["c", "f"], main_shift.d_shift.outgoing_chars
  end

  def test_it_can_compile_shift_results
    main_shift = Shift.new("hello world", "12345", "091920")

    assert_equal "", main_shift.ciphertext

    main_shift.disperse_message
    main_shift.run_shifts

    assert_equal "zescf cfilk", main_shift.compile_shifts
    assert_equal "zescf cfilk", main_shift.ciphertext
  end

  def test_it_can_pull_out_special_characters
    main_shift = Shift.new("hello, world!", "12345", "091920")

    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
    assert_equal expected, main_shift.stash_special_chars
    assert_equal [[",", 5], ["!", 12]], main_shift.special_chars
  end

  def test_it_can_add_special_characters_back_in
    main_shift = Shift.new("hello, world!", "12345", "091920")

    main_shift.disperse_message
    main_shift.run_shifts
    main_shift.compile_shifts
    main_shift.reinsert_special_chars

    assert_equal "zescf, cfilk!", main_shift.ciphertext
  end

  def test_it_can_run_decryption_shifts
    main_shift = Shift.new("zescf cfilk", "12345", "091920")

    main_shift.disperse_message
    main_shift.run_decryption_shifts

    assert_equal ["h", "o", "r"], main_shift.a_shift.outgoing_chars
    assert_equal ["e", " ", "l"], main_shift.b_shift.outgoing_chars
    assert_equal ["l", "w", "d"], main_shift.c_shift.outgoing_chars
    assert_equal ["l", "o"], main_shift.d_shift.outgoing_chars
  end
end
