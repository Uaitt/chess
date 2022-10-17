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
  end
end
