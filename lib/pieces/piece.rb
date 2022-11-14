# frozen_string_literal: true

# set of methods common to all pieces in chess
module Piece
  attr_accessor :movements
  attr_reader :color, :symbol

  def initialize
    @movements = 0
  end

  class << self # add test
    def for(rank, file)
      registry.find { |candidate| candidate.starting_at?(rank, file) }.new
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
