# frozen_string_literal: true

# this class represents a pawn in chess
class Pawn
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def basic_moves
    basic_forward + basic_diagonals
  end

  private

  def basic_forward
    color == :black ? [[1, 0]] : [[-1, 0]]
  end

  def basic_diagonals
    color == :black ? [[1, 1], [1, -1]] : [[-1, 1], [-1, -1]]
  end
end
