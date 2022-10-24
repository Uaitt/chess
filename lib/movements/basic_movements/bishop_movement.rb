# frozen_string_literal: true

require_relative 'basic_movement'

# class that represents a bishop movement in chess
class BishopMovement < BasicMovement
  def direction
    direction = @end_position.zip(@initial_position).map { |finish, start| finish - start }
    factor = direction.max.abs
    direction.map { |component| component / factor }
  end
end
