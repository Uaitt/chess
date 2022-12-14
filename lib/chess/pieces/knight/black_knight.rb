# frozen_string_literal: true

require_relative 'knight'
require_relative '../black_piece'

# this class represents a black knight in chess
class BlackKnight < BlackPiece
  include Knight

  class << self
    def starting_at?(rank, file)
      rank.zero? && [1, 6].include?(file)
    end
  end

  def initialize
    super
    @symbol = "\u265E"
  end
end
