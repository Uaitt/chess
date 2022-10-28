# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'knight'

# this class represents a white knight in chess
class WhiteKnight < WhitePiece
  include Knight

  def self.starts_at?(rank, file)
    rank == 7 && [1, 6].include?(file)
  end
end
