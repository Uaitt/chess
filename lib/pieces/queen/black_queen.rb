# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'queen_basic_moves'

# this class represents a black queen in chess
class BlackQueen < BlackPiece
  include QueenBasicMoves

  def self.starts_at?(rank, file)
    rank.zero? && file == 3
  end
end
