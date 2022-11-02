# frozen_string_literal: true

# set of methods common to all pieces in chess
module Piece
  class << self
    def for(rank, file)
      registry.find { |candidate| candidate.starts_at?(rank, file) }.new
    end

    private

    def registry
      [BlackBishop, BlackKing, BlackKnight, BlackPawn, BlackQueen, BlackRook,
       WhiteBishop, WhiteKing, WhiteKnight, WhitePawn, WhiteQueen, WhiteRook, NilPiece]
    end
  end
end
