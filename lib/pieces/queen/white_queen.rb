# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'queen_basic_moves'

# this class represents a white queen in chess
class WhiteQueen < WhitePiece
  include QueenBasicMoves
  def initial_file
    4
  end
end
