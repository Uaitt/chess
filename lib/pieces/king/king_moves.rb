# frozen_string_literal: true

# this class represents a king in chess
module KingMoves
  def basic_moves
    [[1, 0], [-1, 0], [0, 1], [0, -1],
     [1, 1], [-1, 1], [1, -1], [-1, -1]]
  end
end
