# frozen_string_literal: true

require_relative 'basic_movement'
require_relative 'rook_movement'
require_relative 'bishop_movement'

# this class represents a queen movement in chess
class PawnMovement
  include BasicMovement

  def valid?
    @piece.basic_moves.each_with_index do |move, count|
      return true if reaches_position?(move) && environment_allows?(count)
    end
    false
  end

  def direction
    if vertical_or_horizontal?
      RookMovement
    else
      BishopMovement
    end.new(@board, @piece, @end_position).direction
  end

  private

  def environment_allows?(count)
    arrival_allows?(count) && turn_allows?(count)
  end

  def arrival_allows?(count)
    count.zero? || count == 1 ? !blocked_vertically? : blocked_diagonally?
  end

  def turn_allows?(count)
    count.zero? ? !already_happened? : true
  end

  def blocked_vertically?
    blocked_on_transition? || blocked_on_arrival?
  end

  def blocked_diagonally?
    !@board.data[@end_position[0]][@end_position[1]].nil? &&
      @board.data[@end_position[0]][@end_position[1]].color != @piece.color
  end

  def already_happened?
    @initial_position[0] != (@piece.color == :black ? 1 : 6)
  end

  def blocked_on_arrival?
    !@board.data[@end_position[0]][@end_position[1]].nil?
  end
end
