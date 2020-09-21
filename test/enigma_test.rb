require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new("hello world", "12345", "091920")

    assert_instance_of Enigma, enigma
  end
end
