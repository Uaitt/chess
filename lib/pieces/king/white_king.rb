# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'king_moves'

# this class represents a white king in chess
class WhiteKing < WhitePiece
  include KingMoves

  def file
    3
  end
end
