# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'bishop_basic_moves'

# this class represents a white bishop in chess
class WhiteBishop < WhitePiece
  include BishopBasicMoves
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    WhiteBishop.count += 1
  end

  def initial_file
    WhiteBishop.count == 1 ? 2 : 5
  end
end
