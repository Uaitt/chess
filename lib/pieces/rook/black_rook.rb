# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'rook_basic_moves'

# this class represents a black rook in chess
class BlackRook < BlackPiece
  include RookBasicMoves

  def self.initial_file
    [0, 7]
  end

  def self.initial_rank
    [0]
  end

  def initialize
    super
    BlackRook.count += 1
  end
end
