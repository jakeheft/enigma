require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new("hello world")

    assert_instance_of Enigma, enigma
  end

  # def test_it_has_attributes
  #   enigma = Enigma.new
  #
  #   assert_equal "hello world", enigma.message
  #   assert_equal "12345", enigma.key
  #   assert_equal "091920", enigma.date
  # end

  def test_it_can_generate_a_5_digit_key_that_will_not_change
    enigma = Enigma.new("hello world")
    expected = enigma.key

    assert_equal 5, enigma.key.length

    enigma.generate_key

    assert_equal expected, enigma.key
  end
end
