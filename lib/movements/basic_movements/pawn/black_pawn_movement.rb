# frozen_string_literal: true

require_relative '../../../pieces/pawn/black_pawn'
require_relative 'pawn_movement'

# this class represents a basic black pawn movement in chess
class BlackPawnMovement
  include PawnMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(BlackPawn)
    end
  end

  def allowing_promotion?
    @end_position[0] == 7
  end

  def correct_class?
    @promoted_piece_class == BlackQueen || @promoted_piece_class == BlackRook ||
      @promoted_piece_class == BlackBishop || @promoted_piece_class == BlackKnight
  end
end
