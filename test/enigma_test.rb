require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists
    skip
    enigma = Enigma.new("hello world", "12345", "091920")

    assert_instance_of Enigma, enigma
  end

  def test_it_has_attributes
    skip
    enigma = Enigma.new("hello world", "12345", "091920")

    assert_equal "hello world", enigma.message
    assert_equal "12345", enigma.key
    # assert_equal "091920", enigma.date
  end

  def test_it_can_generate_a_5_digit_key_that_will_not_change
    skip
    enigma = Enigma.new("hello world", "091920")
    expected = enigma.key

    assert_equal 5, enigma.key.length

    enigma.generate_key

    assert_equal expected, enigma.key
  end

  def test_it_can_run_shifts_to_get_encrypted_string
    skip
    enigma = Enigma.new("hello world", "12345", "091920")

    assert_equal "", enigma.encryption

    expected = {
      encryption: "zescf cfilk",
      key:  "12345",
      date: "091920"
    }
    assert_equal expected, enigma.encrypt(enigma.message, enigma.key, enigma.date)
    assert_equal "zescf cfilk", enigma.encryption
  end

  def test_it_can_run_shifts_to_get_encrypted_string_with_special_characters
    skip
    enigma = Enigma.new("hello, world!", "12345", "091920")

    enigma.encrypt(enigma.message, enigma.key, enigma.date)
    assert_equal "zescf, cfilk!", enigma.encryption
  end

  def test_it_can_decrypt
    enigma = Enigma.new("zescf, cfilk!", "12345", "091920")

    expected = {
      decryption: "hello, world!",
      key:  "12345",
      date: "091920"
    }
    assert_equal expected, enigma.decrypt(enigma.message, enigma.key, enigma.date)
  end
end
