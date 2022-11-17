# frozen_string_literal: true

require_relative '../basic_movement'

# set of methods common to all queen movements in chess
module QueenMovement
  include BasicMovement

  def direction
    rook_or_bishop_movement.instance_method(:direction).bind(self).call
  end
end
