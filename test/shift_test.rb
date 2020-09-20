require './test/test_helper'

class ShiftTest < Minitest::Test
  def test_it_exists
    main_shift = Shift.new("hello world")

    assert_instance_of Shift, main_shift
  end

  def test_it_instantiates_each_shift_letter_object
    main_shift = Shift.new("hello world")

    assert_instance_of AShift, main_shift.a_shift
    assert_instance_of BShift, main_shift.b_shift
    assert_instance_of CShift, main_shift.c_shift
    assert_instance_of DShift, main_shift.d_shift
  end

  def test_it_has_an_alphabet_that_can_be_called_on
    main_shift = Shift.new("hello world")

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, main_shift.alpha
    assert_equal "j", main_shift.alpha[9]
    assert_equal " ", main_shift.alpha[26]
    assert_nil main_shift.alpha[28]
  end

  def test_it_has_a_message
    main_shift = Shift.new("hello world")

    assert_equal "hello world", main_shift.message
  end

  def test_it_can_generate_a_5_digit_key_that_will_not_change
    main_shift = Shift.new("hello world")
    expected = main_shift.key

    assert_equal 5, main_shift.key.length

    main_shift.generate_key

    assert_equal expected, main_shift.key
  end
### PUT IN A TEST FOR PULLING THE DATE WHEN YOU'VE FIGURED IT OUT
  def test_it_can_get_the_date_for_the_shift
    main_shift = Shift.new("hello world")

    assert_equal 6, main_shift.date.length

    main_shift.stubs(:date).returns("091920")
    assert_equal "6400", main_shift.date_shift_all
  end
  ### When all letter shifts built, create collection with each so they can be run through enumerable
  def test_it_can_pair_characters_with_values
    main_shift = Shift.new("hello world")

    # look at how to return the position of a letter in an array (find_index(obj))
    # run a map that creates an array of arrays with letter in 0 index and letter-index at 1 index
    # then inside each subclass, you will use that index and just pull the value that exists at the index
    expected = ["a", 0]
    assert_equal expected, main_shift.char_values[0]
  end

  def test_it_can_route_a_string_to_proper_shift_subclasses
    main_shift = Shift.new("hello world")

    main_shift.disperse_message

    assert_equal ["h", "o", "r"], main_shift.a_shift.incoming_chars
    assert_equal ["e", " ", "l"], main_shift.b_shift.incoming_chars
    assert_equal ["l", "w", "d"], main_shift.c_shift.incoming_chars
    assert_equal ["l", "o"], main_shift.d_shift.incoming_chars
  end

end
