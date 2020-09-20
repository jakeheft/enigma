require './test/test_helper'

class DShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("12345", "091920")
    @d_shift = @main_shift.d_shift
  end

  def test_it_exists
    assert_instance_of DShift, @d_shift
  end

end
