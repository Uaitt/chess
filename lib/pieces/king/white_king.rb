# frozen_string_literal: true

require_relative 'king'
require_relative '../white_piece'

# this class represents a white king in chess
class WhiteKing < WhitePiece
  include King

  class << self
    def starting_at?(rank, file)
      rank == 7 && file == 4
    end
  end

  def initialize
    super
    @symbol = "\u265A"
  end
end
