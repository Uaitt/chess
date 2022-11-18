# frozen_string_literal: true

require_relative 'king'
require_relative '../black_piece'

# this class represents a black king in chess
class BlackKing < BlackPiece
  include King

  class << self
    def starting_at?(rank, file)
      rank.zero? && file == 4
    end
  end

  def initialize
    super
    @symbol = "\u265A"
  end
end
