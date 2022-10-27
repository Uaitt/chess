# frozen_string_literal: true

# this class represents a white piece in chess
class WhitePiece
  attr_reader :color

  def initialize
    @color = :white
  end
end
