# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'bishop_basic_moves'

# this class represents a white bishop in chess
class WhiteBishop < WhitePiece
  include BishopBasicMoves

  def self.starts_at?(rank, file)
    rank == 7 && [2, 5].include?(file)
  end
end
