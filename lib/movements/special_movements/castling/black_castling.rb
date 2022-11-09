# frozen_string_literal: true

# this class represents a special black castling movement in chess
class BlackCastling
  def initialize(board, black_king, end_position)
    @board = board
    @black_king = black_king
    @end_position = end_position
  end

  def valid?
    valid_position? && valid_pieces?
  end

  private

  def valid_position?
    @end_position == [0, 2] || @end_position == [0, 6]
  end

  def valid_pieces?
    @black_king.movements.zero? && piece.instance_of?(BlackRook) && piece.movements.zero?
  end

  def piece
    @board.data[0][file]
  end

  def file
    @end_position == [0, 2] ? 0 : 7
  end
end
