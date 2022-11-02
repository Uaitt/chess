# frozen_string_literal: true

require_relative 'piece'

# this class represents a white piece in chess
class WhitePiece
  include Piece

  def initialize
    @color = :white
  end
end
