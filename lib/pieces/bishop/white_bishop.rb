# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'bishop_basic_moves'

# this class represents a white bishop in chess
class WhiteBishop < WhitePiece
  include BishopBasicMoves

  def self.initial_files
    [2, 5]
  end

  def self.ranks
    [7]
  end

  def initialize
    super
    WhiteBishop.count += 1
  end
end
