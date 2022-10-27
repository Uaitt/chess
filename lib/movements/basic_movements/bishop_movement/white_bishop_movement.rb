# frozen_string_literal: true

require_relative '../basic_movement'

# this class represents a basic white bishop movement in chess
class WhiteBishopMovement
  include BasicMovement
  include BishopDirection
end
