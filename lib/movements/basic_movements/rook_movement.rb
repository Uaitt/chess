# frozen_string_literal: true

require_relative 'basic_movement'

# this class represents a rook movement in chess
class RookMovement < BasicMovement
  def direction_vector
    direction = @end_position.zip(@initial_position).map { |finish, start| finish - start }
    factor = direction.reject(&:zero?).first.abs
    Vector.elements(direction.map { |component| component / factor })
  end
end
