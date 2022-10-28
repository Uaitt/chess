# frozen_string_literal: true

require_relative '../basic_movement'
require_relative '../rook/rook_movement'
require_relative '../bishop/bishop_movement'

# set of methods common to all king movements in chess
module KingMovement
  include BasicMovement
  def direction
    if vertical_or_horizontal?
      RookMovement
    else
      BishopMovement
    end.instance_method(:direction).bind(self).call
  end
end
