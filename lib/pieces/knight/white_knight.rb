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

  def initial_file
    [1, 6]
  end

  def initial_rank
    [7]
  end
end
