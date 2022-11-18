# frozen_string_literal: true

require_relative 'bishop'
require_relative '../white_piece'

# this class represents a white bishop in chess
class WhiteBishop < WhitePiece
  include Bishop

  class << self
    def starting_at?(rank, file)
      rank == 7 && [2, 5].include?(file)
    end
  end

  def initialize
    super
    @symbol = "\u265D"
  end
end
