# frozen_string_literal: true

# this class represents a white bishop in chess
class WhiteBishop < Piece
  include Bishop
  @count = 0

  class << self
    attr_accessor :white_bishops
  end

  def initialize(color)
    super
    WhiteBishop.count += 1
  end

  def file
    WhiteBishop.count == 1 ? 2 : 5
  end
end
