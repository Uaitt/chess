# frozen_string_literal: true

require_relative '../../movement'

# set of methods common to all en passant in chess
module EnPassant
  include Movement

  def initialize(board, piece, end_position)
    super
    @left_piece = @board.data[@initial_position[0]][@initial_position[1] - 1]
    @right_piece = @board.data[@initial_position[0]][@initial_position[1] + 1]
    @last_movement = @board.last_movement
  end

  def valid?
    right_rank? && next_to_enemy_pawn? && @last_movement.double_moving?(enemy_pawn)
  end

  def apply
    @piece.movements += 1
    @board.data[enemy_position[0]][enemy_position[1]] = NilPiece.new
    @board.data[@initial_position[0]][@initial_position[1]] = NilPiece.new
    @board.data[@end_position[0]][@end_position[1]] = @piece
    @board.last_movement = self
  end

  private

  def enemy_position
    @board.current_position(enemy_pawn)
  end
end
