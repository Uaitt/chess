# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'knight'

# this class represents a black knight in chess
class BlackKnight < BlackPiece
  include Knight

  def self.starts_at?(rank, file)
    rank.zero? && [1, 6].include?(file)
  end
end
