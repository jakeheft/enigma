require './test/test_helper'

class BShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("12345", "091920")
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
end
