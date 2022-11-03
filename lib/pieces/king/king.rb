# frozen_string_literal: true

# set of methods common to all kings in chess
module King
  class << self
    def for(color)
      if color == :black
        BlackKing
      else
        WhiteKing
      end.new
    end
  end

  def basic_moves
    [[1, 0], [-1, 0], [0, 1], [0, -1],
     [1, 1], [-1, 1], [1, -1], [-1, -1]]
  end
end
