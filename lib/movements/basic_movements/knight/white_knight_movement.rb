# frozen_string_literal: true

require_relative '../../../pieces/knight/white_knight'
require_relative 'knight_movement'

# this class represents a basic white knight movement in chess
class WhiteKnightMovement
  include KnightMovement

  def self.handles?(piece)
    piece.instance_of?(WhiteKnight)
  end
end
