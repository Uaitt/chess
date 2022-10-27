# frozen_string_literal: true

# this class represents a knight in chess
class Knight
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def basic_moves
    [[1, 2], [1, -2], [-1, 2], [-1, -2],
     [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end
end
