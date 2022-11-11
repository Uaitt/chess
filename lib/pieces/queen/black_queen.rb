# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'queen'

# this class represents a black queen in chess
class BlackQueen < BlackPiece
  include Queen

  class << self
    def starting_at?(rank, file)
      rank.zero? && file == 3
    end
  end

  def initialize
    super
    @symbol = "\u265B"
  end
end
