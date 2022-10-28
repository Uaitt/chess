# frozen_string_literal: true

require_relative '../basic_movement'
require_relative '../rook_movement/rook_direction'
require_relative '../bishop_movement/bishop_direction'

# ...
module KingDirection
  def direction
    if vertical_or_horizontal? #basic_direction module for abstract factory
      RookDirection
    else
      BishopDirection
    end.instance_method(:direction).bind(self).call
  end
end
