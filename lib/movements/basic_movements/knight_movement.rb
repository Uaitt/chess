# frozen_string_literal: true

require_relative 'basic_movement'

# this class represents a knight movement in chess
class KnightMovement
  include BasicMovement

  def blocked?
    blocked_on_arrival?
  end

  def direction
    @end_position.zip(@initial_position).map { |finish, start| finish - start }
  end
end
