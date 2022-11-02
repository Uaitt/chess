# frozen_string_literal: true

require_relative '../../../pieces/bishop/black_bishop'
require_relative 'bishop_movement'

# this class represents a basic black bishop movement in chess
class BlackBishopMovement
  include BishopMovement

  def self.handles?(piece)
    piece.instance_of?(BlackBishop)
  end
end
