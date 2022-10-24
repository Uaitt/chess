# frozen_string_literal: true

require_relative 'basic_movement'

# this class represents a rook movement in chess
class KnightMovement
  include BasicMovement

  def blocked?
    blocked_on_arrival?
  end
end
