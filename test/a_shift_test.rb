require './test/test_helper'
require './lib/shift'
require './lib/a_shift'

class AShiftTest < Minitest::Test
  def test_it_exists
    a_shift = AShift.new

    assert_instance_of AShift, a_shift
  end

  def test_it_can_get_shift_value
    main_shift = Shift.new
    a_shift = AShift.new

    main_shift.stubs(:generate_key).returns("12345")
    main_shift.stubs(:date).returns("091920")

    assert_equal 18, a_shift.shift_value
  end
end
