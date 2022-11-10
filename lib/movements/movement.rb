# frozen_string_literal: true

# set of common methods to all movements in chess
module Movement
  def initialize(board, piece, end_position)
    @board = board
    @piece = piece
    @initial_position = @board.current_position(piece)
    @end_position = end_position
  end

  def checks_own_king?
    return true unless in_bound?

    clone_board
    apply
    @board.checked?(@piece.color)
  end

  private

  def clone_board
    @board = @board.dup
    @board.data = @board.data.map(&:clone)
  end
end
