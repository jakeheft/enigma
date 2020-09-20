require './test/test_helper'
require './lib/shift'
require './lib/b_shift'

class BShiftTest < Minitest::Test
  def setup
    @main_shift = Shift.new("12345", "091920")
    @b_shift = @main_shift.b_shift
  end

  def test_it_exists
    assert_instance_of BShift, @b_shift
  end
end
