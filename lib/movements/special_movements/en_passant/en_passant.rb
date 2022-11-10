# frozen_string_literal: true

require_relative '../../movement'

# set of methods common to all en passant in chess
module EnPassant
  include Movement

  def initialize(board, piece, end_position)
    super
    @left_piece = @board.piece_at(left_position)
    @right_piece = @board.piece_at(right_position)
    @last_movement = @board.last_movement
  end

  def valid?
    right_rank? && next_to_enemy_pawn? && @last_movement.double_moving?(enemy_pawn)
  end

  def apply
    super
    @board.place_piece(NilPiece.new, enemy_pawn_position)
  end

  private

  def left_position
    [@initial_position[0], @initial_position[1] - 1]
  end

  def right_position
    [@initial_position[0], @initial_position[1] + 1]
  end

  def enemy_pawn_position
    @board.current_position(enemy_pawn)
  end
end
