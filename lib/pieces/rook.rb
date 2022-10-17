# frozen_string_literal: true

# this class represents a rook in chess
class Rook
  attr_accessor :color

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  def able_to_reach?(current_position, end_position)
    @possible_moves.each do |move|
      return true if current_move_matches?(current_position, move, end_position)
    end

    false
  end

  private

  def create_possible_moves
    [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
     [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  end

  def current_move_matches?(current_position, move, end_position)
    current_position[0] + move[0] == end_position[0] &&
      current_position[1] + move[1] == end_position[1]
  end
end
