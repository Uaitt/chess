# frozen_string_literal: true

# this class represents a king in chess
class King
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def basic_moves
    [[1, 0], [-1, 0], [0, 1], [0, -1],
     [1, 1], [-1, 1], [1, -1], [-1, -1]]
  end
end
