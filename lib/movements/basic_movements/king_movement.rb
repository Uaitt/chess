# frozen_string_literal: true

require_relative 'basic_movement'
require_relative 'rook_movement'
require_relative 'bishop_movement'

# this class represents a king movement in chess
class KingMovement
  include BasicMovement

  def direction
    if vertical_or_horizontal?
      RookMovement
    else
      BishopMovement
    end.new(@board, @piece, @end_position).direction
  end

  private

  def vertical_or_horizontal?
    @initial_position[0] == @end_position[0] ||
      @initial_position[1] == @end_position[1]
  end
end
