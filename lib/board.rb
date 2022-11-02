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

  def checked?(king)
    @data.any? do |row|
      row.any? do |piece|
        able_to_capture?(piece, king)
      end
    end
  end

  def able_to_capture?(piece, king)
    piece.color != king.color && BasicMovement.for(piece, board).valid?
  end
end
