# frozen_string_literal: true

require_relative 'rook_movement'

# this class represents a basic black rook movement in chess
class BlackRookMovement
  include RookMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(BlackRook)
    end
  end
end
