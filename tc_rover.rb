require_relative "rover"
require_relative "driver"
require "minitest/autorun"


class TestRover < MiniTest::Unit::TestCase
  def setup
    @rover = Rover.new(1, 2, 'N')
    @rover_2 = Rover.new(1, 2, 'W')
  end

  def test_is_object?
    assert_equal true, @rover.is_a?(Object)
  end

  def test_is_rover_instance?
    assert_equal true, @rover.instance_of?(Rover)
  end

  def test_update_orientation_to_move_in_1
    @rover.orientation_to_move_in = 'N'
    assert_equal 'W', @rover.update_orientation_to_move_in('L')
    assert_equal 'E', @rover.update_orientation_to_move_in('R')
    assert_raises do 
      @rover.orientation_to_move_in = 'Xm'
      @rover.update_orientation_to_move_in('L')
    end
  end

  def test_update_orientation_to_move_in_2
    @rover.orientation_to_move_in = 'W'
    assert_equal 'S', @rover.update_orientation_to_move_in('L')
    assert_equal 'N', @rover.update_orientation_to_move_in('R')
  end

  def test_update_orientation_to_move_in_3
    @rover.orientation_to_move_in = 'S'
    assert_equal 'E', @rover.update_orientation_to_move_in('L')
    assert_equal 'W', @rover.update_orientation_to_move_in('R')
  end

  def test_update_orientation_to_move_in_4
    @rover.orientation_to_move_in = 'E'
    assert_equal 'N', @rover.update_orientation_to_move_in('L')
    assert_equal 'S', @rover.update_orientation_to_move_in('R')
  end

  def test_change_orientation_1
    @rover.orientation_to_move_in = 'E'
    updated_orientation = @rover.change_orientation('L')
    assert_equal @rover.orientation_to_move_in, updated_orientation
  end

  def test_change_orientation_2
    @rover.orientation_to_move_in = 'N'
    updated_orientation = @rover.change_orientation('L')
    assert_equal 'W', updated_orientation
  end

  def test_move_1
    @rover.current_position = {x: 1, y: 2, heading: 'N'}
    @rover.orientation_to_move_in = 'N'
    assert_raises(RuntimeError) do
      @rover.move
    end
  end


end
