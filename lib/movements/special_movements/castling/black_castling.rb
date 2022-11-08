# frozen_string_literal: true

# this class represents a special black castling movement in chess
class BlackCastling
  def initialize(board, black_king, end_position)
    @board = board
    @black_king = black_king
    @end_position = end_position
    @black_rook = @board.data[0][file]
  end

  private

  def file
    @end_position == [0, 2] ? 0 : 7
  end
end
