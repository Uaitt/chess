# frozen_string_literal: true

require_relative '../black_piece'

# this class represents a black pawn in chess
class BlackPawn < BlackPiece
  def self.starts_at?(rank, file)
    rank == 1 && [0, 1, 2, 3, 4, 5, 6, 7].include?(file)
  end

  def basic_moves
    [[2, 0], [1, 0], [1, 1], [1, -1]]
  end
end
