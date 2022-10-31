# frozen_string_literal: true

# this class represents a special black en passant movement in chess
class BlackEnPassant
  def initialize(board, black_pawn, end_position, last_movement)
    @board = board
    @black_pawn = black_pawn
    @initial_position = board.current_position(black_pawn)
    @left_piece = @board.data[@initial_position[0]][@initial_position[1] - 1]
    @right_piece = @board.data[@initial_position[0]][@initial_position[1] + 1]
    @end_position = end_position
    @last_movement = last_movement
  end

  def valid?
    right_rank? && next_to_white_pawn? && @last_movement.allowing_en_passant?
  end

  private

  def right_rank?
    @initial_position[0] == 4
  end

  def next_to_white_pawn?
    @left_piece.instance_of?(WhitePawn) || @right_piece.instance_of?(WhitePawn)
  end
end
