# frozen_string_literal: true

require_relative '../basic_movement'
require_relative 'rook_direction'

# this class represents a basic white rook movement in chess
class WhiteRookMovement
  include BasicMovement
  include RookDirection
end
