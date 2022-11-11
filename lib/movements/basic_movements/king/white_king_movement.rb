# frozen_string_literal: true

require_relative '../../../pieces/king/white_king'
require_relative 'king_movement'

# this class represents a basic white king movement in chess
class WhiteKingMovement
  include KingMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(WhiteKing)
    end
  end
end
