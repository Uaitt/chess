# frozen_string_literal: true

require_relative 'rook'
require_relative '../white_piece'

# this class represents a white rook in chess
class WhiteRook < WhitePiece
  include Rook

  class << self
    def starting_at?(rank, file)
      rank == 7 && [0, 7].include?(file)
    end
  end

  def initialize
    super
    @symbol = "\u265C"
  end
end
