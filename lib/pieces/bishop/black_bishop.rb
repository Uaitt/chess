# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'bishop_moves'

# this class represents a black bishop in chess
class BlackBishop < BlackPiece
  include BishopMoves
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    BlackBishop.count += 1
  end

  def file
    BlackBishop.count == 1 ? 2 : 5
  end
end
