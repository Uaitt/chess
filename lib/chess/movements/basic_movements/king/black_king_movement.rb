# frozen_string_literal: true

require_relative 'king_movement'

# this class represents a basic black king movement in chess
class BlackKingMovement
  include KingMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(BlackKing)
    end
  end
end
