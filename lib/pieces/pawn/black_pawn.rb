# frozen_string_literal: true

require_relative '../black_piece'

# this class represents a black pawn
class BlackPawn < BlackPiece
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    BlackPawn.count += 1
  end

  def initial_file
    BlackPawn.count - 1
  end

  def basic_moves
    [[2, 0], [1, 0], [1, 1], [1, -1]]
  end
end
