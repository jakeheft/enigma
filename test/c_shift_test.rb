require './test/test_helper'

class CShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("12345", "091920")
    @c_shift = @main_shift.c_shift
  end

  def test_it_exists
    assert_instance_of CShift, @c_shift
  end

end
