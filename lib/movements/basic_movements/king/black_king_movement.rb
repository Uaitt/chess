# frozen_string_literal: true

require_relative '../../../pieces/king/black_king'
require_relative 'king_movement'

# this class represents a basic black king movement in chess
class BlackKingMovement
  include KingMovement

  def self.handles?(piece)
    piece.instance_of?(BlackKing)
  end
end
