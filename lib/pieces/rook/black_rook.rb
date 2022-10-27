# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'rook_basic_moves'

# this class represents a black rook in chess
class BlackRook < BlackPiece
  include RookBasicMoves
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    BlackRook.count += 1
  end

  def initial_file
    BlackRook.count == 1 ? 0 : 7
  end
end
