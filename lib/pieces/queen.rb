# frozen_string_literal: true

require_relative 'rook'
require_relative 'bishop'

# this class represents a queen in chess
class Queen
  attr_accessor :color, :possible_moves

  def initialize(color)
    @color = color
    @possible_moves = create_possible_moves
  end

  private

  def create_possible_moves
    Rook.new(color).possible_moves + Bishop.new(color).possible_moves
  end
end
