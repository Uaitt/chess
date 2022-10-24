# frozen_string_literal: true

# this class represents a bishop in chess
class Bishop
  attr_accessor :color, :possible_moves

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  private

  def create_possible_moves
    top_left_bottom_right_moves + bottom_right_top_left_moves +
      top_right_bottom_left_moves + bottom_left_top_right_moves
  end

  def top_left_bottom_right_moves
    [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
  end

  def bottom_right_top_left_moves
    [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
  end

  def top_right_bottom_left_moves
    [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
  end

  def bottom_left_top_right_moves
    [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
  end
end
