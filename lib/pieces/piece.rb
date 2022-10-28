# frozen_string_literal: true

# set of methods common to all pieces in chess
module Piece
  def self.for(rank, file)
    registry.find { |candidate| candidate.starts_at?(rank, file) }.new
  end

  def self.registry
    [BlackBishop, BlackKing, BlackKnight, BlackPawn, BlackQueen, BlackRook,
     WhiteBishop, WhiteKing, WhiteKnight, WhitePawn, WhiteQueen, WhiteRook, NilPiece]
  end
end
