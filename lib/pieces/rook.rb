# frozen_string_literal: true

# this class represents a rook in chess
class Rook
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def basic_moves
    towards_bottom + towards_top +
      towards_right + towards_left
  end

  private

  def towards_bottom
    [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
  end

  def towards_top
    [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
  end

  def towards_right
    [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  end

  def towards_left
    [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
  end
end
