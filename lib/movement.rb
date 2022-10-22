# frozen_string_literal: true

# this class represents a basic movement in a chess board
class BasicMovement
  def initialize(board, piece, end_position)
    @board = board
    @piece = piece
    @initial_position = board.current_position(piece)
    @end_position = end_position
  end
end
