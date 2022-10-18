# frozen_string_literal: true

# this class represents a bishop in chess
class Bishop
  attr_accessor :color

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  def able_to_reach?(current_position, end_position)
    @possible_moves.each do |move|
      return true if reaches_position?(current_position, move, end_position)
    end
    false
  end

  def blocked?(board, current_position, end_position)
    base_move = base_move(current_position, end_position)

    blocked_on_path?(board, base_move, current_position, end_position) ||
      blocked_on_final_square?(board, end_position)
  end

  private

  def create_possible_moves
    left_right_up__down_moves + left_right_down__up_moves +
      right_left_up_down_moves + right_left_down_up_moves
  end

  def reaches_position?(current_position, move, end_position)
    current_position[0] + move[0] == end_position[0] &&
      current_position[1] + move[1] == end_position[1]
  end

  def base_move(current_position, end_position)
    move = end_position.zip(current_position).map { |finish, current| finish - current }
    factor = move.max.abs
    move.map { |item| item / factor }
  end

  def left_right_up__down_moves
    [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
  end

  def left_right_down__up_moves
    [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
  end

  def right_left_up_down_moves
    [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
  end

  def right_left_down_up_moves
    [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
  end

  def blocked_on_path?(board, base_move, current_position, end_position)
    current_position = current_position.zip(base_move).map(&:sum)
    until current_position == end_position
      return true unless board.data[current_position[0]][current_position[1]].nil?

      current_position = current_position.zip(base_move).map(&:sum)
    end
    false
  end

  def blocked_on_final_square?(board, end_position)
    !board.data[end_position[0]][end_position[1]].nil? &&
      board.data[end_position[0]][end_position[1]].color == @color
  end
end
