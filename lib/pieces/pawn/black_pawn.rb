# frozen_string_literal: true

require_relative '../black_piece'

# this class represents a black pawn in chess
class BlackPawn < BlackPiece

  def self.initial_file
    [0, 1, 2, 3, 4, 5, 6, 7]
  end

  def self.initial_rank
    [1]
  end

  def initialize
    super
    BlackPawn.count += 1
  end

  def basic_moves
    [[2, 0], [1, 0], [1, 1], [1, -1]]
  end
end
