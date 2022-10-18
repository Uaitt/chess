# frozen_string_literal: true

# this class represents a bishop in chess
class Bishop
  attr_accessor :color

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  def able_to_reach?(_, end_position)
    case end_position
    when [1, 1]
      true
    when [2, 2]
      true
    when [7, 7]
      true
    else
      false
    end
  end

  private

  def create_possible_moves
    left_to_right_moves + right_to_left_moves
  end

  def left_to_right_moves
    [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
     [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
  end

  def right_to_left_moves
    [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
     [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
  end
end
