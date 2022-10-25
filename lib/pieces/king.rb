# frozen_string_literal: true

# this class represents a king in chess
class King
  attr_reader :color

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves

    private

    def create_possible_moves
      [[1, 0], [-1, 0], [0, 1], [0, -1],
       [1, 1], [-1, 1], [1, -1], [-1, -1]]
    end
  end
end
