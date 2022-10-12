# frozen_string_literal: true

# this class represents the board in chess
class Board
  def initialize
    set_black_pieces
    set_white_pieces
  end

  def move(piece, end_position)
    initial_position = current_position(piece)
    @data[end_position[0]][end_position[1]] = piece
    @data[initial_position[0]][initial_position[1]] = nil
  end

  private

  def current_position(piece)
    @data.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        return [row_index, column_index] if square == piece
      end
    end
  end
end
