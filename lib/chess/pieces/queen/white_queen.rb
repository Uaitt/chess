# frozen_string_literal: true

require_relative 'queen'
require_relative '../white_piece'

# this class represents a white queen in chess
class WhiteQueen < WhitePiece
  include Queen

  class << self
    def starting_at?(rank, file)
      rank == 7 && file == 3
    end
  end

  def initialize
    super
    @symbol = "\u265B"
  end
end
