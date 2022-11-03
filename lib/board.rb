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
    @data.any? do |row|
      row.any? do |piece|
        BasicMovement.for(self, piece, current_position(king)).valid?
      end
    end
  end

  def mated?(king)
    king.basic_moves.all? do |move|
      if valid?(new_position(move, king))
        BasicMovement.for(self, king, new_position(move, king)).checks_own_king?
      else
        true
      end
    end
  end

  private

  def new_position(move, king)
    move.zip(current_position(king)).map(&:sum)
  end

  def valid?(new_position)
    new_position[0] >= 0 && new_position[0] <= 7 &&
      new_position[1] >= 0 && new_position[1] <= 7
  end
end
