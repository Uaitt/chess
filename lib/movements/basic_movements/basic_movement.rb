# frozen_string_literal: true

# this class represents a basic movement in a chess board
class BasicMovement
  def initialize(board, piece, end_position = nil)
    @board = board
    @piece = piece
    @initial_position = board.current_position(piece)
    @end_position = end_position
  end

  def possible?
    @piece.possible_moves.each do |move|
      return true if reaches_position?(move)
    end
    false
  end

  def blocked?
  end

  private

  def reaches_position?(move)
    @initial_position[0] + move[0] == @end_position[0] &&
      @initial_position[1] + move[1] == @end_position[1]
  end
end
