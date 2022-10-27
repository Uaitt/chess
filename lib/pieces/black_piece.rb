# frozen_string_literal: true

# this class represents a black piece in chess
class BlackPiece
  attr_reader :color

  def initialize
    @color = :black
  end
end
