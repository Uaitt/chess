# frozen_string_literal: true

# this class represents a special black castling movement in chess
class BlackCastling
  def initialize(board, black_king, end_position)
    @board = board
    @black_king = black_king
    @initial_position = @board.current_position(@black_king)
    @end_position = end_position
  end

  def valid?
    valid_end_position? && valid_pieces? &&
      @board.allowing_castling?(@black_king.color, separating_positions, king_path) && !checks_own_king?
  end

  def apply
    @board.data[@end_position[0]][@end_position[1]] = @black_king
    @board.data[@initial_position[0]][@initial_position[1]] = NilPiece.new
    @black_king.movements += 1
    @board.data[new_rook_position[0]][new_rook_position[1]] = piece
    @board.data[rook_position[0]][rook_position[1]] = NilPiece.new
    piece.movements += 1
  end

  private

  def valid_end_position?
    @end_position == [0, 2] || @end_position == [0, 6]
  end

  def valid_pieces?
    @black_king.movements.zero? && piece.instance_of?(BlackRook) && piece.movements.zero?
  end

  def piece
    @board.data[rank][file]
  end

  def rank
    0
  end

  def file
    @end_position[1] == 2 ? 0 : 7
  end

  def separating_positions
    file.zero? ? [[0, 1], [0, 2], [0, 3]] : [[0, 5], [0, 6]]
  end

  def king_path
    separating_positions.length == 3 ? separating_positions[1..] : separating_positions
  end

  def rook_position
    @board.current_position(piece)
  end

  def new_rook_position
    @end_position[1] == 2 ? [0, 3] : [0, 5]
  end
end
