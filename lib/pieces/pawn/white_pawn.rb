# frozen_string_literal: true

require_relative '../white_piece'

# this class represents a black pawn
class WhitePawn < whitePiece
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    WhitePawn.count += 1
  end

  def initial_file
    WhitePawn.count - 1
  end

  def basic_moves
    [[2, 0], [1, 0], [-1, 1], [-1, -1]]
  end
end
