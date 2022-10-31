# frozen_string_literal: true

# ...
class BlackEnPassant
  def initialize(board, pawn, end_position)
    @board = board
    @pawn = pawn
    @initial_position = board.current_position(pawn)
    @end_position = end_position
  end

  def valid?
    @initial_position[0] == 4 && adjacent_pawn? && enemy_pawn_just_double_moved?
  end

  def adjacent_pawn?
    @board.data[@initial_position[0]][@initial_position[1] + 1].instance_of?(WhitePawn) ||
      @board.data[@initial_position[0]][@initial_position[1] - 1].instance_of?(WhitePawn)
  end
end
