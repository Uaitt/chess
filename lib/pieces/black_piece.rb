# frozen_string_literal: true

require_relative 'piece'

# this class represents a black piece in chess
class BlackPiece
  include Piece

  def initialize
    @color = :black
  end
end
