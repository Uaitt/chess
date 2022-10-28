# frozen_string_literal: true

# ...
module KnightDirection
  def direction
    @end_position.zip(@initial_position).map { |finish, start| finish - start }
  end
end
