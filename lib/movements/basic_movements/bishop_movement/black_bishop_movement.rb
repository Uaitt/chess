# frozen_string_literal: true

require_relative '../basic_movement'

# this class represents a basic black bishop movement in chess
class BlackBishopMovement
  include BasicMovement
  include BishopDirection
end
