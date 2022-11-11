# frozen_string_literal: true

require_relative '../../../pieces/queen/white_queen'
require_relative 'queen_movement'

# this class represents a basic white queen movement in chess
class WhiteQueenMovement
  include QueenMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(WhiteQueen)
    end
  end
end
