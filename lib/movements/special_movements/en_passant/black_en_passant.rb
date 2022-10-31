# frozen_string_literal: true

# ...
class BlackEnPassant
  def initialize(board, black_pawn, end_position)
    @board = board
    @black_pawn = black_pawn
    @initial_position = board.current_position(black_pawn)
    @left_piece = @board.data[@initial_position[0]][@initial_position[1] - 1]
    @right_piece = @board.data[@initial_position[0]][@initial_position[1] + 1]
    @end_position = end_position
  end

  def valid?
    right_rank? && next_to_white_pawn? && white_pawn_just_double_moved?
  end

  private

  def right_rank?
    @initial_position[0] == 4
  end

  def next_to_white_pawn?
    @left_piece.instance_of?(WhitePawn) || @right_piece.instance_of?(WhitePawn)
  end

  def white_pawn_just_double_moved?
  end

  def white_pawn
    @left_piece.instance_of?(WhitePawn) ? @left_piece : @right_piece
  end
end
