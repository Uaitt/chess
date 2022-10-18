# frozen_string_literal: true

# this class represents a rook in chess
class Rook
  attr_accessor :color

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  def able_to_reach?(current_position, end_position)
    @possible_moves.each do |move|
      return true if current_move_matches?(current_position, move, end_position)
    end
    false
  end

  def blocked?(board, current_position, end_position)
    blocked_on_path?(board, current_position, end_position) ||
      blocked_on_final_square?(board, end_position)
  end

  private

  def base_move
    factor = @move.reject(&:zero?).first.abs
    @move.collect { |item| item / factor }
  end

  def create_possible_moves
    forward_moves + backward_moves
  end

  def forward_moves
    [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
     [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  end

  def backward_moves
    [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
     [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
  end

  def current_move_matches?(current_position, move, end_position)
    current_position[0] + move[0] == end_position[0] &&
      current_position[1] + move[1] == end_position[1]
  end

  def blocked_on_path?(board, current_position, end_position)
    until current_position == end_position
      current_position = current_position.zip(base_move).map(&:sum)

      return true unless board.data[current_position[0]][current_position[1]].nil?
    end
    false
  end

  def blocked_on_final_square?(board, end_position)
    board.data[end_position[0]][end_position[1]].color == @color
  end
end
