# frozen_string_literal: true

require_relative '../../../pieces/pawn/black_pawn'
require_relative 'pawn_movement'

# this class represents a basic black pawn movement in chess
class BlackPawnMovement
  include PawnMovement

  def self.handles?(piece)
    piece.instance_of?(BlackPawn)
  end
end
