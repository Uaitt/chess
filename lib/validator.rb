# frozen_string_literal: true

# this class represents a validator that checks wether various inputs are valid or not
class Validator
  def valid_coordinate?(coordinate)
    valid_length?(coordinate) && valid_values?(coordinate)
  end

  def valid_move?(board, piece, end_position)
    current_position = board.current_position(piece)
    piece.able_to_reach?(current_position, end_position) &&
      piece.meets_nobody?(board, current_position, end_position)
  end

  private

  def valid_length?(coordinate)
    coordinate.length == 2
  end

  def valid_values?(coordinate)
    coordinate[0] >= 'a' && coordinate[0] <= 'h' &&
      coordinate[1] >= '1' && coordinate[1] <= '8'
  end
end
