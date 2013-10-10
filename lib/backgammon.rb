require 'ruby-processing'
require './lib/board'
require './lib/board_view'

class Backgammon < Processing::App

  attr_reader :board, :board_view, :current_role

  def setup
    @board = Board.new
    @board_view = BoardView.new(self, board)
    @current_player = :white
    smooth
  end

  def draw
    board_view.render
  end

  def mouse_clicked
    board_view.grid.each do |key, hash|
      if mouse_x < hash[:xmax] && mouse_x > hash[:xmin] && mouse_y < hash[:ymax] && mouse_y > hash[:ymin]
        eval_next_move(key)
      end
    end
  end

  def eval_next_move(key)
    case key
    when :roll then roll_dice
    end
  end

  def roll_dice
    @current_role = [rand(6).to_s, rand(6).to_s]
    text_size(32)
    text(current_role[0], 350, 380)
    text(current_role[1], 650, 380)
  end

end

Backgammon.new(:width => 1000, :height => 800, :title => "Backgammon")
