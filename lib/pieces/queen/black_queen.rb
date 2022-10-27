# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'queen_basic_moves'

# this class represents a black queen in chess
class BlackQueen < BlackPiece
  include QueenBasicMoves

  def initial_file
    4
  end
end
