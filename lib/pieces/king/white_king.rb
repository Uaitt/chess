# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'king_basic_moves'

# this class represents a white king in chess
class WhiteKing < WhitePiece
  include KingBasicMoves

  def initial_file
    3
  end
end
