class BoardView

  attr_reader :app, :board

  def initialize(app, board)
    @app = app
    @board = board
  end

  def render
    draw_background
    draw_points
    draw_bar
    draw_gutters
  end

  def draw_backgroud
    #add background image
  end

  def draw_white_checker(x,y)
  end

  def draw_black_checker(x,y)
  end

  def draw_gutters
    white_count = board.gutter[:white]
    black_count = board.gutter[:black]
    draw_gutter_white(white_count, 838, 130)
    draw_gutter_black(black_count, 838, 670)
  end

  def draw_gutter_white(count, x, y)
  end

  def draw_gutter_black(count, x, y)
  end

  def draw_bar
    white_count = board.bar[:white]
    black_count = board.bar[:black]
    draw_top_point_white(white_count, 475, 200)
    draw_bottom_point_black(black_count, 475, 650)
  end

  def draw_points
    draw_top_row_of_points
    draw_bottom_row_of_points
  end

  def draw_top_row_of_points
    (1..12).each do |i|
      white_count = board.points[i][:white]
      black_count = board.points[i][:black]
      x = grid[i][:xmin]
      y = grid[i][:ymin]
      draw_top_point_white(white_count, x, y)
      draw_top_point_black(black_count, x, y)
    end
  end

  def draw_top_point_white(white_count, x, y)
    if white_count < 4
      offset = 55
      y_new = y.dup
      white_count.times do
        draw_white_checker(x,y_new)
        y_new += offset
      end
    else
      offset = 20
      y_new = y.dup
      white_count.times do
        draw_white_checker(x,y_new)
        y_new += offset
      end
    end
  end

  def draw_top_point_black(black_count, x, y)
    if black_count < 4
      offset = 55
      y_new = y.dup
      black_count.times do
        draw_black_checker(x,y_new)
        y_new += offset
      end
    else
      offset = 20
      y_new = y.dup
      black_count.times do
        draw_black_checker(x,y_new)
        y_new += offset
      end
    end
  end

  def draw_bottom_row_of_points
    (13..24).each do |i|
      white_count = board.points[i][:white]
      black_count = board.points[i][:black]
      x = grid[i][:xmin]
      y = grid[i][:ymax - 50]
      draw_bottom_point_white(white_count, x, y)
      draw_bottom_point_black(black_count, x, y)
    end
  end

  def draw_bottom_point_white(white_count, x, y)
    if white_count < 4
      offset = 55
      y_new = y.dup
      white_count.times do
        draw_white_checker(x,y_new)
        y_new -= offset
      end
    else
      offset = 20
      y_new = y.dup
      white_count.times do
        draw_white_checker(x,y_new)
        y_new -= offset
      end
    end
  end

  def draw_bottom_point_black(black_count, x, y)
    if black_count < 4
      offset = 55
      y_new = y.dup
      black_count.times do
        draw_black_checker(x,y_new)
        y_new -= offset
      end
    else
      offset = 20
      y_new = y.dup
      black_count.times do
        draw_black_checker(x,y_new)
        y_new -= offset
      end
    end
  end

  def grid
    {
      :g3 => {:xmin => 100, :xmax => 174, :ymin => 100, :ymax => 700},
      :g2 => {:xmin => 825, :xmax => 900, :ymin => 400, :ymax => 700},
      :g1 => {:xmin => 825, :xmax => 900, :ymin => 100, :ymax => 399},
      :bar => {:xmin => 475, :xmax => 524, :ymin => 100, :ymax => 700},
      1 => {:xmin => 775, :xmax => 824, :ymin => 100, :ymax => 399},
      2 => {:xmin => 725, :xmax => 774, :ymin => 100, :ymax => 399},
      3 => {:xmin => 675, :xmax => 724, :ymin => 100, :ymax => 399},
      4 => {:xmin => 625, :xmax => 674, :ymin => 100, :ymax => 399},
      5 => {:xmin => 575, :xmax => 624, :ymin => 100, :ymax => 399},
      6 => {:xmin => 525, :xmax => 574, :ymin => 100, :ymax => 399},
      7 => {:xmin => 425, :xmax => 524, :ymin => 100, :ymax => 399},
      8 => {:xmin => 375, :xmax => 424, :ymin => 100, :ymax => 399},
      9 => {:xmin => 325, :xmax => 374, :ymin => 100, :ymax => 399},
      10 => {:xmin => 275, :xmax => 324, :ymin => 100, :ymax => 399},
      11 => {:xmin => 225, :xmax => 274, :ymin => 100, :ymax => 399},
      12 => {:xmin => 175, :xmax => 224, :ymin => 100, :ymax => 399},
      13 => {:xmin => 175, :xmax => 224, :ymin => 400, :ymax => 700},
      14 => {:xmin => 225, :xmax => 274, :ymin => 400, :ymax => 700},
      15 => {:xmin => 275, :xmax => 324, :ymin => 400, :ymax => 700},
      16 => {:xmin => 325, :xmax => 374, :ymin => 400, :ymax => 700},
      17 => {:xmin => 375, :xmax => 424, :ymin => 400, :ymax => 700},
      18 => {:xmin => 425, :xmax => 524, :ymin => 400, :ymax => 700},
      19 => {:xmin => 525, :xmax => 574, :ymin => 400, :ymax => 700},
      20 => {:xmin => 575, :xmax => 624, :ymin => 400, :ymax => 700},
      21 => {:xmin => 625, :xmax => 674, :ymin => 400, :ymax => 700},
      22 => {:xmin => 675, :xmax => 724, :ymin => 400, :ymax => 700},
      23 => {:xmin => 725, :xmax => 774, :ymin => 400, :ymax => 700},
      24 => {:xmin => 775, :xmax => 824, :ymin => 400, :ymax => 700}
    }
  end

end
