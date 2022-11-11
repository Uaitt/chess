# frozen_string_literal: true

require_relative '../../../pieces/rook/white_rook'
require_relative 'rook_movement'

# this class represents a basic white rook movement in chess
class WhiteRookMovement
  include RookMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(WhiteRook)
    end
  end
end
