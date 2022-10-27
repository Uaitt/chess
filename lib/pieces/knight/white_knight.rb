# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'knight_basic_moves'

# this class represents a white knight in chess
class WhiteKnight < WhitePiece
  include KnightBasicMoves
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    WhiteKnight.count += 1
  end

  def initial_file
    WhiteKnight.count == 1 ? 1 : 6
  end
end
