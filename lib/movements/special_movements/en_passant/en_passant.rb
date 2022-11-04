# frozen_string_literal: true

# set of methods common to all en passant in chess
module EnPassant
  def initialize(board, pawn, end_position, last_movement)
    @board = board
    @pawn = pawn
    @initial_position = board.current_position(@pawn)
    @left_piece = @board.data[@initial_position[0]][@initial_position[1] - 1]
    @right_piece = @board.data[@initial_position[0]][@initial_position[1] + 1]
    @end_position = end_position
    @last_movement = last_movement
  end

  def valid?
    right_rank? && next_to_enemy_pawn? && @last_movement.allows_en_passant?(enemy_pawn)
  end

  def apply
    @board.data[enemy_position[0]][enemy_position[1]] = NilPiece.new
    @board.data[@initial_position[0]][@initial_position[1]] = NilPiece.new
    @board.data[@end_position[0]][@end_position[1]] = @pawn
  end

  private

  def enemy_position
    @board.current_position(enemy_pawn)
  end
end
