# frozen_string_literal: true

require_relative 'basic_movement'

# this class represents a queen movement in chess
class PawnMovement
  include BasicMovement

  def possible?
    @piece.basic_moves.each_with_index do |move, count|
      return true if reaches_position?(move) && arrival_clear?(count)
    end
    false
  end

  private

  def arrival_clear?(count)
    if count.zero?
      true
    else
      !@board.data[@end_position[0]][@end_position[1]].nil? &&
        @board.data[@end_position[0]][@end_position[1]].color != @piece.color
    end
  end
end
