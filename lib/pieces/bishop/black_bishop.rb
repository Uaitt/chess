# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'bishop_basic_moves'

# this class represents a black bishop in chess
class BlackBishop < BlackPiece
  include BishopBasicMoves

  def self.initial_files
    [2, 5]
  end

  def self.ranks
    [0]
  end

  def initialize
    super
    BlackBishop.count += 1
  end
end
