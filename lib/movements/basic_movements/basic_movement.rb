# frozen_string_literal: true

# set of common methods for basic movements in a chess
module BasicMovement
  def initialize(board, piece, end_position)
    @board = board
    @piece = piece
    @initial_position = board.current_position(piece)
    @end_position = end_position
  end

  def valid?
    possible? && !not_blocked?
  end

  def possible?
    @piece.possible_moves.each do |move|
      return true if reaches_position?(move)
    end
    false
  end

  def blocked?
    blocked_on_transition? || blocked_on_arrival?
  end

  private

  def reaches_position?(move)
    @initial_position[0] + move[0] == @end_position[0] &&
      @initial_position[1] + move[1] == @end_position[1]
  end

  def blocked_on_transition?
    @current_position = @initial_position.zip(direction).map(&:sum)
    until @current_position == @end_position
      return true unless @board.data[@current_position[0]][@current_position[1]].nil?

      @current_position = @current_position.zip(direction).map(&:sum)
    end
    false
  end

  def blocked_on_arrival?
    !@board.data[@end_position[0]][@end_position[1]].nil? &&
      @board.data[@end_position[0]][@end_position[1]].color == @piece.color
  end
end
