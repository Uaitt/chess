# frozen_string_literal: true

# set of methods for piece creation in chess
module Piece
  def self.for(rank, file)
    registry.find { |candidate| candidate.rank == rank && candidate.file == file }.new
  end

  def self.registry
    [BlackBishop, BlackKing, BlackKnight, BlackPawn, BlackQueen, BlackRook,
     WhiteBishop, WhiteKing, WhiteKnight, WhitePawn, WhiteQueen, WhiteRook]
  end
end
