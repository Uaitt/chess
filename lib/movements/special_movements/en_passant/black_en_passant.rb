# frozen_string_literal: true

# ...
class BlackEnPassant
  def initialize(board, pawn, end_position)
    @board = board
    @pawn = pawn
    @initial_position = board.current_position(pawn)
    @left_piece = @board.data[@initial_position[0]][@initial_position[1] - 1]
    @right_piece = @board.data[@initial_position[0]][@initial_position[1] + 1]
    @end_position = end_position
  end

  def valid?
    right_rank? && adjacent_white_pawn? && adjacent_white_pawn_just_double_moved?
  end

  private

  def right_rank?
    @initial_position[0] == 4
  end

  def adjacent_white_pawn?
    @left_piece.instance_of?(WhitePawn) || @right_piece.instance_of?(WhitePawn)
  end
end
