# frozen_string_literal: true

# this class represents a knight in chess
class Knight
  attr_reader :color, :possible_moves

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  private

  def create_possible_moves
    [[1, 2], [1, -2], [-1, 2], [-1, -2],
     [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end
end
