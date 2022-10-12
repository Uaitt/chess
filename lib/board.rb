# frozen_string_literal: true

# this class represents the board in chess
class Board
  def set
    dispose_pieces('black')
    dispose_pieces('white')
  end

  def move(piece, end_position)
    initial_position = current_position(piece)
    @data[end_position[0]][end_position[1]] = piece
    @data[initial_position[0]][initial_position[1]] = nil
  end

  private

  def dispose_pieces(color)
    dispose_main_pieces(color)
    dispose_pawns(color)
  end

=begin
  def dispose_main_pieces(color)
  end

  def dispose_pawns(color)
    row = color == 'black' ? 1 : 6
    @data[row].map! { Pawn.new(color) }
  end
=end

  def current_position(piece)
    @data.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        return [row_index, column_index] if square == piece
      end
    end
  end
end
