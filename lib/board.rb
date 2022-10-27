# frozen_string_literal: true

require_relative 'pieces/piece'

# this class represents the board in chess
class Board
  attr_reader :data

  def initialize
    @data = Array.new(8) { Array.new(8, nil) }
  end

  def set
    @data.map!.with_index do |row, rank|
      row.map.with_index do |_, file|
        Piece.for(rank, file)
      end
    end
  end

  def current_position(piece)
    @data.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        return [row_index, column_index] if square == piece
      end
    end
  end

  def piece_at_position(end_position)
    @data[end_position[0]][end_position[1]]
  end
end
