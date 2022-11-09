# frozen_string_literal: true
require 'pry-byebug'
# ...
module Castling
  def initialize(board, black_king, end_position)
    @board = board
    @black_king = black_king
    @initial_position = @board.current_position(@black_king)
    @end_position = end_position
    @rook = @board.data[rank][file]
  end

  def valid?
    valid_end_position? && valid_pieces? &&
      @board.allowing_castling?(@black_king.color, separating_positions, king_path) && !checks_own_king?
  end

  def apply
    increment_movements
    move_king
    move_rook
  end

  def checks_own_king?
    return true unless in_bound?(@end_position)

    clone_board
    apply
    @board.checked?(@black_king.color)
  end

  private

  def in_bound?(position)
    position[0] >= 0 && position[0] <= 7 &&
      position[1] >= 0 && position[1] <= 7
  end

  def clone_board
    @board = @board.dup
    @board.data = @board.data.map(&:clone)
  end

  def valid_end_position?
    @end_position == [rank, 2] || @end_position == [rank, 6]
  end

  def valid_pieces?
    @black_king.movements.zero? && @rook.instance_of?(rook_class) && @rook.movements.zero?
  end

  def rook_position
    @board.current_position(@rook)
  end

  def increment_movements
    @black_king.movements += 1
    @rook.movements += 1
  end

  def move_king
    @board.data[@end_position[0]][@end_position[1]] = @black_king
    @board.data[@initial_position[0]][@initial_position[1]] = NilPiece.new
  end

  def move_rook
    @board.data[rook_position[0]][rook_position[1]] = NilPiece.new
    @board.data[new_rook_position[0]][new_rook_position[1]] = @rook
  end
end
