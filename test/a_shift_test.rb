require './test/test_helper'
require './lib/shift'
require './lib/a_shift'

class AShiftTest < Minitest::Test
  def test_it_exists
    a_shift = AShift.new

    assert_instance_of AShift, a_shift
  end
end
