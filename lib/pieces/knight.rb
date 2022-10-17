# frozen_string_literal: true

# this class represents a knight in chess
class Knight
  attr_accessor :color

  def initialize(color)
    @color = color
    @possible_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                       [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end

  def able_to_reach?(current_position, end_position)
    @possible_moves.each do |move|
      return true if current_move_matches?(current_position, move, end_position)
    end
    false
  end

  def meets_nobody?(_, _, _)
    true
  end

  private

  def current_move_matches?(current_position, move, end_position)
    current_position[0] + move[0] == end_position[0] &&
      current_position[1] + move[1] == end_position[1]
  end
end
