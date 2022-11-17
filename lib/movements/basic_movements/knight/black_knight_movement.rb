# frozen_string_literal: true

require_relative 'knight_movement'

# this class represents a basic black knight movement in chess
class BlackKnightMovement
  include KnightMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(BlackKnight)
    end
  end
end
