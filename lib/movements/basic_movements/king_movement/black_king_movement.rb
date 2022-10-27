# frozen_string_literal: true

require_relative '../basic_movement'
require_relative 'king_direction'

# this class represents a basic black king movement in chess
class BlackKingMovement
  include BasicMovement
  include KingDirection
end
