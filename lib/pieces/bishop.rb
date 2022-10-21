# frozen_string_literal: true

# this class represents a bishop in chess
class Bishop
  attr_accessor :color, :possible_moves

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

  def base_move(current_position, end_position)
    move = end_position.zip(current_position).map { |finish, current| finish - current }
    factor = move.max.abs
    move.map { |item| item / factor }
  end

  private

  def create_possible_moves
    top_left_bottom_right_moves + bottom_right_top_left_moves +
      top_right_bottom_left_moves + bottom_left_top_right_moves
  end

  def reaches_position?(current_position, move, end_position)
    current_position[0] + move[0] == end_position[0] &&
      current_position[1] + move[1] == end_position[1]
  end

  def top_left_bottom_right_moves
    [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
  end

  def bottom_right_top_left_moves
    [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
  end

  def top_right_bottom_left_moves
    [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
  end

  def bottom_left_top_right_moves
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
