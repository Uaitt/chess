# frozen_string_literal: true

# ...
module RookDirection
  def direction
    direction = @end_position.zip(@initial_position).map { |finish, start| finish - start }
    factor = direction.reject(&:zero?).first.abs
    direction.map { |component| component / factor }
  end
end
