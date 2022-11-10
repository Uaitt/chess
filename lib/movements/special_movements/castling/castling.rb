# frozen_string_literal: true

require_relative '../../movement'

# set of methods common to all castling in chess
module Castling
  include Movement

  def initialize(board, piece, end_position)
    super
    @second_piece = @board.data[rank][file]
  end

  def valid?
    valid_end_position? && valid_pieces? &&
      @board.allowing_castling?(@piece.color, separating_positions, king_path) && !checks_own_king?
  end

  def apply
    increment_movements
    move_king
    move_rook
    @board.last_movement = self
  end

  private

  def clone_board
    @board = @board.dup
    @board.data = @board.data.map(&:clone)
  end

  def valid_end_position?
    @end_position == [rank, 2] || @end_position == [rank, 6]
  end

  def valid_pieces?
    @piece.movements.zero? && @second_piece.instance_of?(rook_class) && @second_piece.movements.zero?
  end

  def rook_position
    @board.current_position(@second_piece)
  end

  def increment_movements
    @piece.movements += 1
    @second_piece.movements += 1
  end

  def move_king
    @board.data[@end_position[0]][@end_position[1]] = @piece
    @board.data[@initial_position[0]][@initial_position[1]] = NilPiece.new
  end

  def move_rook
    @board.data[rook_position[0]][rook_position[1]] = NilPiece.new
    @board.data[new_rook_position[0]][new_rook_position[1]] = @second_piece
  end
end
