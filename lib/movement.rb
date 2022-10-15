# frozen_string_literal: true

# this class represents the movement a certain piece tries to make
class Movement
  def initialize(board, piece, end_position)
    @board = board
    @piece = piece
    @current_position = board.current_position(piece)
    @end_position = end_position
  end

  def valid?
    @piece.able_to_reach?(@current_position, @end_position) &&
      @piece.meets_nobody?(@board, @current_position, @end_position)
  end
end
