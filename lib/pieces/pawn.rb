# frozen_string_literal: true

# this class represents a pawn in chess
class Pawn
  attr_reader :color

  def initialize(color)
    @color = color
  end
end
