# frozen_string_literal: true

require_relative '../../../pieces/pawn/white_pawn'
require_relative 'pawn_movement'

# this class represents a basic white pawn movement in chess
class WhitePawnMovement
  include PawnMovement

  class << self
    def moving?(piece)
      piece.instance_of?(WhitePawn)
    end
  end
end
