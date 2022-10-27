# frozen_string_literal: true

require_relative 'bishop_moves'
require_relative '../white_piece'

# this class represents a white bishop in chess
class WhiteBishop < WhitePiece
  include BishopMoves
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    WhiteBishop.count += 1
  end

  def file
    WhiteBishop.count == 1 ? 2 : 5
  end
end
