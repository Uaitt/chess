# frozen_string_literal: true

require_relative '../special_movement'

# set of methods common to all castling in chess
module Castling
  include SpecialMovement

  def initialize(board, piece, end_position)
    super
    @second_piece = @board.data[rank][file]
  end

  def valid?
    valid_end_position? && valid_pieces? &&
      @board.allowing_castling?(@piece.color, separating_positions, king_path) && !checks_own_king?
  end

  def apply(board)
    super
    @second_piece.movements += 1
    board.place_piece(NilPiece.new, rook_position)
    board.place_piece(@second_piece, new_rook_position)
  end

  def double_moving?(_)
    false
  end

  private

  def valid_end_position?
    @end_position == [rank, 2] || @end_position == [rank, 6]
  end

  def valid_pieces?
    @piece.movements.zero? && @second_piece.instance_of?(rook_class) && @second_piece.movements.zero?
  end

  def rook_position
    @board.current_position(@second_piece)
  end

  def fake_apply
    super
    @duplicated_board.place_piece(NilPiece.new, rook_position)
    @duplicated_board.place_piece(@second_piece, new_rook_position)
  end
end
