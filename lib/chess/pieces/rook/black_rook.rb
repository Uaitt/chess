# frozen_string_literal: true

require_relative 'rook'
require_relative '../black_piece'

# this class represents a black rook in chess
class BlackRook < BlackPiece
  include Rook

  class << self
    def starting_at?(rank, file)
      rank.zero? && [0, 7].include?(file)
    end
  end

  def initialize
    super
    @symbol = "\u265C"
  end
end
