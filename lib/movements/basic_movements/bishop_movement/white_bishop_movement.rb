# frozen_string_literal: true

require_relative '../basic_movement'
require_relative 'bishop_direction'

# this class represents a basic white bishop movement in chess
class WhiteBishopMovement
  include BasicMovement
  include BishopDirection
end
