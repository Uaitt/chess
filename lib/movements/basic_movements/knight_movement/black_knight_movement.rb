# frozen_string_literal: true

require_relative '../basic_movement'
require_relative 'knight_direction'

# this class represents a basic black knight movement in chess
class BlackKnightMovement
  include BasicMovement
  include KnightDirection

  def blocked?
    blocked_on_arrival?
  end
end
