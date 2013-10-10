require 'ruby-processing'
require './lib/board'
require './lib/board_view'

class Backgammon < Processing::App

  attr_reader :board, :board_view

  def setup
    @board = Board.new
    @board_view = BoardView.new
  end

  def draw
    board_view.render
  end


end

Backgammon.new(:width => 1000, :height => 800, :title => "Backgammon")
