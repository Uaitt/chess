# frozen_string_literal: true

require_relative 'knight_movement'

# this class represents a basic white knight movement in chess
class WhiteKnightMovement
  include KnightMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(WhiteKnight)
    end
  end
end
