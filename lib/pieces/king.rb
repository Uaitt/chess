# frozen_string_literal: true

# this class represents a king in chess
class King
  attr_reader :color, :possible_moves

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  private

  def create_possible_moves
    [[1, 0], [-1, 0], [0, 1], [0, -1],
      [1, 1], [-1, 1], [1, -1], [-1, -1]]
  end
end
