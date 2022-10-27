# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'knight_basic_moves'

# this class represents a black knight in chess
class BlackKnight < BlackPiece
  include KnightBasicMoves
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    BlackKnight.count += 1
  end

  def initial_file
    BlackKnight.count == 1 ? 1 : 6
  end
end
