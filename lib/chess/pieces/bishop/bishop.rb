# frozen_string_literal: true

# set of methods common to all bishops in chess
module Bishop
  def basic_moves
    towards_bottom_right_corner_moves + towards_top_left_corner_moves +
      towards_bottom_left_corner_moves + toward_top_right_corner_moves
  end

  private

  def towards_bottom_right_corner_moves
    [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
  end

  def towards_top_left_corner_moves
    [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
  end

  def towards_bottom_left_corner_moves
    [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
  end

  def toward_top_right_corner_moves
    [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
  end
end
