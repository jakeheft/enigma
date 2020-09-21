require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new("hello world", "12345", "091920")

    assert_instance_of Enigma, enigma
  end

  def test_it_has_attributes
    enigma = Enigma.new("hello world", "12345", "091920")

    assert_equal "hello world", enigma.message
    assert_equal "12345", enigma.key
    assert_equal "091920", enigma.date
  end
end
