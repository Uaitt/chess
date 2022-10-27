# frozen_string_literal: true

require_relative '../basic_movement'
require_relative 'king_direction'

# this class represents a basic white king movement in chess
class WhiteKingMovement
  include BasicMovement
  include KingDirection
end
