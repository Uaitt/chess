# frozen_string_literal: true

# set of methods common to all knights in chess
module KnightBasicMoves
  def basic_moves
    [[1, 2], [1, -2], [-1, 2], [-1, -2],
     [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end
end
