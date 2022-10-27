# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'king_moves'

# this class represents a black king in chess
class BlackKing < BlackPiece
  include KingMoves

  def file
    3
  end
end
