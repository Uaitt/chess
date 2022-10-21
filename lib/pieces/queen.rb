# frozen_string_literal: true

# this class represents a queen in chess
class Queen
  attr_accessor :color, :possible_moves

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  def able_to_reach?(current_position, end_position)
    possible_moves.each do |move|
      return true if reaches_position?(current_position, move, end_position)
    end
    false
  end

  private

  def create_possible_moves
    Rook.new(color).possible_moves + Bishop.new(color).possible_moves
  end

  def reaches_position?(current_position, move, end_position)
    current_position[0] + move[0] == end_position[0] &&
      current_position[1] + move[1] == end_position[1]
  end
end
