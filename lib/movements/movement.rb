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

  def apply
    @piece.movements += 1 # to test
    @board.place_piece(NilPiece.new, @initial_position)
    @board.place_piece(@piece, @end_position)
    @board.last_movement = self # to test
  end

  private

  def clone_board
    @board = @board.dup
    @board.data = @board.data.map(&:clone)
  end

  def in_bound?
    @end_position[0] >= 0 && @end_position[0] <= 7 &&
      @end_position[1] >= 0 && @end_position[1] <= 7
  end
end
