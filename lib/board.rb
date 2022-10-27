# frozen_string_literal: true

require_relative 'pieces/piece'

# this class represents the board in chess
class Board
  attr_reader :data

  def initialize
    @data = Array.new(8) { Array.new(8, nil) }
  end

  def set
    @data.map.with_index do |row, rank|
      row.map.with_index do |_, file|
        Piece.for(rank, file)
      end
    end
  end

  def move(piece, end_position) # to remove
    initial_position = current_position(piece)
    @data[end_position[0]][end_position[1]] = piece
    @data[initial_position[0]][initial_position[1]] = nil
  end

  def current_position(piece)
    @data.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        return [row_index, column_index] if square == piece
      end
    end
  end

  def get_piece(end_position)
    @data[end_position[0]][end_position[1]]
  end

  private

=begin
  def dispose_pieces(color)
    dispose_main_pieces(color)
    dispose_pawns(color)
  end

  def dispose_main_pieces(color)
    row = color == :black ? 0 : 7
    @data[row].map!.with_index { |_, file| Piece.for(file) }
  end

  def dispose_pawns(color)
    row = color == :black ? 1 : 6
    @data[row].map! { Pawn.new(color) }
  end
=end
  def current_piece(index)
    case index
    when 0, 7 then Rook
    when 1, 6 then Knight
    when 2, 5 then Bishop
    when 3 then Queen
    when 4 then King
    end
  end
end
