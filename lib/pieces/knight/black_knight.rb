# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'knight_basic_moves'

# this class represents a black knight in chess
class BlackKnight < BlackPiece
  include KnightBasicMoves

  def initialize
    super
    BlackKnight.count += 1
  end

  def initial_file
    [1, 6]
  end

  def initial_rank
    [0]
  end
end
