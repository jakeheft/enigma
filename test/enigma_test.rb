require './test/test_helper'
require 'date'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_a_5_digit_key_that_will_not_change
    enigma = Enigma.new

    enigma.stubs(:rand).returns(349)

    assert_equal 5, enigma.generate_key.length
    assert_equal "00349", enigma.key
  end

  def test_it_can_run_shifts_to_get_encrypted_string
    enigma = Enigma.new

    assert_equal "", enigma.encryption

    expected = {
      encryption: "zescf cfilk",
      key:  "12345",
      date: "091920"
    }
    assert_equal expected, enigma.encrypt("hello world", "12345", "091920")
    assert_equal "zescf cfilk", enigma.encryption
  end

  def test_it_can_run_shifts_to_get_encrypted_string_with_special_characters
    enigma = Enigma.new

    enigma.encrypt("hello, world!", "12345", "091920")
    assert_equal "zescf, cfilk!", enigma.encryption
  end

  def test_it_can_decrypt
    enigma = Enigma.new

    expected = {
      decryption: "hello, world!",
      key:  "12345",
      date: "091920"
    }
    assert_equal expected, enigma.decrypt("zescf, cfilk!", "12345", "091920")
  end

  def test_it_can_get_todays_date
    enigma = Enigma.new
    date = DateTime.now
    expected = date.strftime("%d%m%y")
    assert_equal expected, enigma.get_date
  end
end
