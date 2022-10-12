# frozen_string_literal: true

# this class represents a knight in chess
class Knight
  attr_reader :position

  def initialize
    @current_position = [0, 1]
  end
end
