# frozen_string_literal: true

require_relative '../../../pieces/bishop/white_bishop'
require_relative 'bishop_movement'

# this class represents a basic white bishop movement in chess
class WhiteBishopMovement
  include BishopMovement

  def self.handles?(piece)
    piece.instance_of?(WhiteBishop)
  end
end
