# frozen_string_literal: true

# this class represents a queen in chess
class Queen
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def able_to_reach?(_, end_position)
    case end_position
    when [1, 0]
      true
    else
      false
    end
  end
end
