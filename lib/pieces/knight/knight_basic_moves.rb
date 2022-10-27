# frozen_string_literal: true

# this class represents a knight in chess
module KnightBasicMoves
  def basic_moves
    [[1, 2], [1, -2], [-1, 2], [-1, -2],
     [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end
end
