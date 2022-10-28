# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'rook'

# this class represents a white rook in chess
class WhiteRook < WhitePiece
  include Rook

  def self.starts_at?(rank, file)
    rank == 7 && [0, 7].include?(file)
  end
end
