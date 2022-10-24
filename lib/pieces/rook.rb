# frozen_string_literal: true

# this class represents a rook in chess
class Rook
  attr_accessor :color, :possible_moves

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  private

  def create_possible_moves
    up_to_down_moves + down_to_up_moves +
      left_to_right_moves + right_to_left_moves
  end

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
