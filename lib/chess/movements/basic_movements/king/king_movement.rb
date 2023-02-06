# frozen_string_literal: true

require_relative '../basic_movement'

# set of methods common to all king movements in chess
module KingMovement
  include BasicMovement

  def direction
    rook_or_bishop_movement.instance_method(:direction).bind_call(self)
  end
end
