# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'king'

# this class represents a black king in chess
class BlackKing < BlackPiece
  include King

  def self.starts_at?(rank, file)
    rank.zero? && file == 4
  end
end
