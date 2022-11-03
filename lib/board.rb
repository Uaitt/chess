# frozen_string_literal: true

# this class represents the board in chess
class Board
  attr_accessor :data

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

  def checked?(king)
    return false if current_position(king.opposite_color).nil? # change in mated(king.opposite_color)?

    @data.any? do |row|
      row.any? do |piece|
        BasicMovement.for(self, piece, current_position(king)).valid?
      end
    end
  end
end
