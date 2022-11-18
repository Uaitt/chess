# frozen_string_literal: true

require_relative 'knight'
require_relative '../white_piece'

# this class represents a white knight in chess
class WhiteKnight < WhitePiece
  include Knight

  class << self
    def starting_at?(rank, file)
      rank == 7 && [1, 6].include?(file)
    end
  end

  def initialize
    super
    @symbol = "\u265E"
  end
end
