# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'rook'

# this class represents a black rook in chess
class BlackRook < BlackPiece
  include Rook

  class << self
    def starting_at?(rank, file)
      rank.zero? && [0, 7].include?(file)
    end
  end
end
