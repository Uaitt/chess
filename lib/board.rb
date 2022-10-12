# frozen_string_literal: true

# this class represents the board in chess
class Board
  def move(piece, end_position)
    initial_position = piece.position
    @data[end_position[0]][end_position[1]] = piece
    @data[initial_position[0]][initial_position[1]] = nil
  end
end
