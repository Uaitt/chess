# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'king'

# this class represents a white king in chess
class WhiteKing < WhitePiece
  include King

  def self.starts_at?(rank, file)
    rank == 7 && file == 4
  end

  def opposite_color
    BlackKing.new
  end
end
