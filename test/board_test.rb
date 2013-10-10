require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/board'

class BoardTest < MiniTest::Test

  attr_reader :board

  def setup
    @board = Board.new
  end

  def test_it_correctly_counts_black_non_home_count
    assert_equal 10, board.black_non_home_count
  end

  def test_it_knows_if_all_blacks_are_in_home_area
    refute board.black_all_home?
  end

  def test_it_correltly_counts_white_non_home_count
    assert_equal 10, board.white_non_home_count
  end

  def test_it_knows_if_all_white_are_in_home_area
    refute board.white_all_home?
  end

  def test_reset_works
    board.points[3][:black] = 20     
    board.bar[:white] = 10
    board.gutter[:white] = 1
    default_board = Board.new
    board.reset
    assert_equal default_board.points, board.points
    assert_equal default_board.bar, board.bar
    assert_equal default_board.gutter, board.gutter
  end

  def test_it_can_update_points
    point_id = 20
    white_count = 5
    black_count = 0
    board.update_point(point_id, white_count, black_count)
    assert_equal white_count, board.points[point_id][:white]
    assert_equal black_count, board.points[point_id][:black]
  end

  def test_it_can_update_bar
    white_count = 1
    black_count = 2
    board.update_bar(white_count, black_count)
    assert_equal white_count, board.bar[:white] 
    assert_equal black_count, board.bar[:black]
  end

  def test_it_can_update_gutter
    assert_equal 0, board.gutter[:white]
    board.update_gutter(:white)
    assert_equal 1, board.gutter[:white]  
  end

end
