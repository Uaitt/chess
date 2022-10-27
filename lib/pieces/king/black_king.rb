# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'king_basic_moves'

# this class represents a black king in chess
class BlackKing < BlackPiece
  include KingBasicMoves

  def self.initial_file
    [3]
  end

  def self.initial_rank
    [0]
  end
end
