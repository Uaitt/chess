# frozen_string_literal: true

require_relative 'basic_movement'
require_relative 'rook_movement'
require_relative 'bishop_movement'

# this class represents a queen movement in chess
class QueenMovement
  include BasicMovement

  def direction
    if vertical_or_horizontal?
      RookMovement
    else
      BishopMovement
    end.new(@board, @piece, @end_position).direction
  end
end
