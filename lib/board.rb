class Board

  attr_accessor :points, :gutter, :bar

  def initialize
    @points = default_points
    @gutter = default_gutter
    @bar = default_bar
  end

  def default_points
    {
      1 => {:black => 0, :white => 2},
      2 => {:black => 0, :white => 0},
      3 => {:black => 0, :white => 0},
      4 => {:black => 0, :white => 0},
      5 => {:black => 0, :white => 0},
      6 => {:black => 5, :white => 0},
      7 => {:black => 0, :white => 0},
      8 => {:black => 3, :white => 0},
      9 => {:black => 0, :white => 0},
      10 => {:black => 0, :white => 0},
      11 => {:black => 0, :white => 0},
      12 => {:black => 0, :white => 5},
      13 => {:black => 5, :white => 0},
      14 => {:black => 0, :white => 0},
      15 => {:black => 0, :white => 0},
      16 => {:black => 0, :white => 0},
      17 => {:black => 0, :white => 3},
      18 => {:black => 0, :white => 0},
      19 => {:black => 0, :white => 5},
      20 => {:black => 0, :white => 0},
      21 => {:black => 0, :white => 0},
      22 => {:black => 0, :white => 0},
      23 => {:black => 0, :white => 0},
      24 => {:black => 2, :white => 0}
    }
  end

  def default_bar
    { :black => 0, :white => 0 }
  end

  def default_gutter
    { :black => 0, :white => 0 }
  end

  def reset
    self.points = default_points
    self.gutter = default_gutter
    self.bar    = default_bar
  end

  def update_point(point_id, white_count, black_count)
    points[point_id][:white] = white_count
    points[point_id][:black] = black_count
  end

  def update_bar(white_count, black_count)
    bar[:white] = white_count
    bar[:black] = black_count
  end

  def update_gutter(color)
    gutter[color] += 1 
  end

  def black_all_home?
    black_non_home_count == 0 
  end

  def black_non_home_count
    total = bar[:black]
    (7..24).inject(total) { |total, i| total += points[i][:black] }
  end

  def white_all_home?
    white_non_home_count == 0
  end

  def white_non_home_count
    total = bar[:white]
    (1..18).inject(total) { |total, i| total += points[i][:white] }
  end
end
