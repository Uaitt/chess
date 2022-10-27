# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'bishop_basic_moves'

# this class represents a black bishop in chess
class BlackBishop < BlackPiece
  include BishopBasicMoves
  @count = 0

  class << self
    attr_accessor :count
  end

  def initialize
    super
    BlackBishop.count += 1
  end

  def initial_file
    BlackBishop.count == 1 ? 2 : 5
  end
end
