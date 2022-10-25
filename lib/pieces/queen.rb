# frozen_string_literal: true

require_relative 'rook'
require_relative 'bishop'

# this class represents a queen in chess
class Queen
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def basic_moves
    Rook.new(color).possible_moves + Bishop.new(color).possible_moves
  end
end
