# frozen_string_literal: true

require_relative 'basic_movement'

# this class represents a queen movement in chess
class PawnMovement
  include BasicMovement

  def possible?
    @piece.basic_moves.each_with_index do |move, count|
      return true if reaches_position?(move) && environment_allows?(count)
    end
    false
  end

  private

  def environment_allows?(count)
    arrival_allows?(count) && turn_allows?(count)
  end

  def arrival_allows?(count)
    return true if count.zero? || count == 1

    !@board.data[@end_position[0]][@end_position[1]].nil? &&
      @board.data[@end_position[0]][@end_position[1]].color != @piece.color
  end

  def turn_allows?(count)
    count.zero? ? !already_happened? : true
  end

  def already_happened?
    @initial_position[0] != (@piece.color == :black ? 1 : 6)
  end
end
