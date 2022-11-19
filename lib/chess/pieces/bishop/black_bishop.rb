# frozen_string_literal: true

require_relative 'bishop'
require_relative '../black_piece'

# this class represents a black bishop in chess
class BlackBishop < BlackPiece
  include Bishop

  class << self
    def starting_at?(rank, file)
      rank.zero? && [2, 5].include?(file)
    end
  end

  def initialize
    super
    @symbol = "\u265D"
  end
end
