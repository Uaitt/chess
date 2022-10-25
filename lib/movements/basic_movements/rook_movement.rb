# frozen_string_literal: true

require_relative 'basic_movement'

# this class represents represents a rook movement in chess
class RookMovement
  include BasicMovement

  def direction
    direction = @end_position.zip(@initial_position).map { |finish, start| finish - start }
    factor = direction.reject(&:zero?).first.abs
    direction.map { |component| component / factor }
  end
end
