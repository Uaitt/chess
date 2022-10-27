# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'bishop_basic_moves'

# this class represents a black bishop in chess
class BlackBishop < BlackPiece
  include BishopBasicMoves

  def self.starts_at?(rank, file)
    rank.zero? && [2, 5].include?(file)
  end
end
