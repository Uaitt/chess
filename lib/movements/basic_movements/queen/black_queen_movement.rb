# frozen_string_literal: true

require_relative '../../../pieces/queen/black_queen'
require_relative 'queen_movement'

# this class represents a basic black queen movement in chess
class BlackQueenMovement
  include QueenMovement

  def self.handles?(piece)
    piece.instance_of?(BlackQueen)
  end
end
