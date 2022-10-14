# frozen_string_literal: true

# this class represents a knight in chess
class Knight
  attr_accessor :color

  def initialize(color)
    @color = color
    @possible_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                       [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end

  def reachable?(initial_position, end_position)
    @possible_moves.each do |current_move|
      if current_move_matches?(initial_position, current_move, end_position)
        @current_move = current_move
        return true
      end
    end
    false
  end

  private

  def current_move_matches?(initial_position, current_move, end_position)
    initial_position[0] + current_move[0] == end_position[0] &&
      initial_position[1] + current_move[1] == end_position[1]
  end
end
