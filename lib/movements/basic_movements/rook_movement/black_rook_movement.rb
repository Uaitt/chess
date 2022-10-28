# frozen_string_literal: true

require_relative '../basic_movement'
require_relative 'rook_direction'

# this class represents a basic black rook movement in chess
class BlackRookMovement
  include BasicMovement
  include RookDirection
end
