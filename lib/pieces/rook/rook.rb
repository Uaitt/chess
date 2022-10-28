# frozen_string_literal: true

# set of methods common to all rooks in chess
module Rook
  def basic_moves
    towards_bottom_moves + towards_top_moves +
      towards_right_moves + towards_left_moves
  end

  private

  def towards_bottom_moves
    [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
  end

  def towards_top_moves
    [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
  end

  def towards_right_moves
    [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  end

  def towards_left_moves
    [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
  end
end
