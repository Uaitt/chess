# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'rook_basic_moves'

# this class represents a black rook in chess
class WhiteRook < WhitePiece
  include RookBasicMoves

  def self.starts_at?(rank, file)
    rank == 7 && [0, 7].include?(file)
  end
end
