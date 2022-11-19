# frozen_string_literal: true

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

  def available_class?(input)
    %w[BlackQueen BlackRook BlackBishop BlackKnight].include?(input)
  end
end
