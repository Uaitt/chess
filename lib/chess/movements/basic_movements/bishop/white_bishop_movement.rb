# frozen_string_literal: true

require_relative 'bishop_movement'

# this class represents a basic white bishop movement in chess
class WhiteBishopMovement
  include BishopMovement

  class << self
    def moving?(piece, _)
      piece.instance_of?(WhiteBishop)
    end
  end
end
