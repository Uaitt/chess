# frozen_string_literal: true

# this class represents a rook in chess
class Rook
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def basic_moves
    up_to_down_moves + down_to_up_moves +
      left_to_right_moves + right_to_left_moves
  end

  private

  def up_to_down_moves
    [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
  end

  def down_to_up_moves
    [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
  end

  def left_to_right_moves
    [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  end

  def right_to_left_moves
    [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
  end
end
