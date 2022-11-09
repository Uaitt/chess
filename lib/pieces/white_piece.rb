# frozen_string_literal: true

require_relative 'piece'

# this class represents a white piece in chess
class WhitePiece
  include Piece

  def initialize
    super
    @color = :white
  end
end
