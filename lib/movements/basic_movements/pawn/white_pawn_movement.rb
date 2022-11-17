# frozen_string_literal: true

require_relative 'pawn_movement'

# this class represents a basic white pawn movement in chess
class WhitePawnMovement
  include PawnMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(WhitePawn)
    end
  end

  def allowing_promotion?
    @end_position[0].zero?
  end

  def available_class?(input)
    %w[WhiteQueen WhiteRook WhiteBishop WhiteKnight].include?(input)
  end
end
