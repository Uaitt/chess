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
    valid_position? && valid_pieces? && !checks_own_king? &&
      @board.allows_castling?(:black, separating_positions, king_path)
  end

  private

  def valid_position?
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
end
