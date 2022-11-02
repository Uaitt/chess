# frozen_string_literal: true

# set of methods common to all pieces in chess
module Piece
  class << self
    def for(rank, file)
      registry.find { |candidate| candidate.starts_at?(rank, file) }.new
    end

    private

    def registry
      black_registry + white_registry + [NilPiece]
    end

    def black_registry
      [BlackBishop, BlackKing, BlackKnight, BlackPawn, BlackQueen, BlackRook]
    end

    def white_registry
      [WhiteBishop, WhiteKing, WhiteKnight, WhitePawn, WhiteQueen, WhiteRook]
    end
  end
end
