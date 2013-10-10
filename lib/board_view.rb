class BoardView

  attr_reader :app, :board

  def initialize(app, board)
    @app = app
    @board = board
  end

  def checker_offset
    {
      :low    => 45,
      :med    => 30,
      :high   => 20,
      :gutter => 12
    }
  end

  def render
    draw_background
    draw_points
    draw_bar
    draw_gutters
    #draw_shadow
  end

  def draw_background
    bg = app.load_image('./resources/images/game-bg.png', 'png')
    app.image(bg, 0, 0)
  end

  def draw_gutters
    draw_gutter_white(board.gutter[:white], 835, 600)
    draw_gutter_black(board.gutter[:black], 835, 176)
  end

  def draw_gutter_white(count, x, y)
    y_new = y
    count.times do
      draw_white_gutter(x,y_new)
      y_new -= checker_offset[:gutter]
    end
  end

  def draw_gutter_black(count, x, y)
    y_new = y
    count.times do
      draw_black_gutter(x,y_new)
      y_new += checker_offset[:gutter]
    end
  end

  def draw_bar
    draw_top_point_white(board.bar[:white], 475, 200)
    draw_bottom_point_black(board.bar[:black], 475, 550)
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

  def draw_bottom_row_of_points
    (13..24).each do |i|
      white_count = board.points[i][:white]
      black_count = board.points[i][:black]
      x = grid[i][:xmin]
      y = grid[i][:ymax] - 50
      draw_bottom_point_white(white_count, x, y)
      draw_bottom_point_black(black_count, x, y)
    end
  end

  def draw_top_point_white(white_count, x, y)
    if white_count < 4
      draw_whites(checker_offset[:low], white_count, x, y)
    elsif white_count > 10
      draw_whites(checker_offset[:high], white_count, x, y)
    else
      draw_whites(checker_offset[:med], white_count, x, y)
    end
  end

  def draw_top_point_black(black_count, x, y)
    if black_count < 4
      draw_blacks(checker_offset[:low], black_count, x, y)
    elsif black_count > 10
      draw_blacks(checker_offset[:high], black_count, x, y)
    else
      draw_blacks(checker_offset[:med], black_count, x, y)
    end
  end

  def draw_bottom_point_white(white_count, x, y)
    if white_count < 4
      draw_whites(-checker_offset[:low], white_count, x, y)
    elsif white_count > 10
      draw_whites(-checker_offset[:high], white_count, x, y)
    else
      draw_whites(-checker_offset[:med], white_count, x, y)
    end
  end

  def draw_bottom_point_black(black_count, x, y)
    if black_count < 4
      draw_blacks(-checker_offset[:low], black_count, x, y)
    elsif black_count > 10
      draw_blacks(-checker_offset[:high], black_count, x, y)
    else
      draw_blacks(-checker_offset[:med], black_count, x, y)
    end
  end

  def draw_whites(offset, count, x, y)
    y_new = y
    count.times do
      draw_white_checker(x,y_new)
      y_new += offset
    end
  end

  def draw_blacks(offset, count, x, y)
    y_new = y
    count.times do
      draw_black_checker(x,y_new)
      y_new += offset
    end
  end

  def draw_white_checker(x,y)
    checker = app.load_image('./resources/images/piece-white.png', 'png')
    app.image(checker, x, y)
  end

  def draw_black_checker(x,y)
    checker = app.load_image('./resources/images/piece-brown.png', 'png')
    app.image(checker, x, y)
  end

  def draw_white_gutter(x, y)
    checker = app.load_image('./resources/images/piece-white-stack.png', 'png')
    app.image(checker, x, y)
  end

  def draw_black_gutter(x,y)
    checker = app.load_image('./resources/images/piece-brown-stack.png', 'png')
    app.image(checker, x, y)
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
