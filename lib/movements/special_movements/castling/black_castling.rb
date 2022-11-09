# frozen_string_literal: true

# this class represents a special black castling movement in chess
class BlackCastling
  def initialize(board, black_king, end_position)
    @board = board
    @black_king = black_king # the first piece to be moved has to be the king for castling
    @end_position = end_position
    @piece = @board.data[0][file]
  end

  def valid?
    valid_position? && !king_already_moved? && !rook_already_moved? &&
      !@board.checked?(:black) && @board.allows_castling?(:black) &&
        !checks_own_king? && empty_squares?
  end

  private

  def file
    @end_position == [0, 2] ? 0 : 7
  end

  def valid_position?
    @end_position == [0, 2] || @end_position == [0, 6]
  end

  def king_already_moved?
    @board.current_position(@black_king) != [0, 4]
  end

  def rook_already_moved?
    @piece.class != BlackRook
  end
end
