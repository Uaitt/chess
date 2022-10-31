# frozen_string_literal: true

# set of common methods to all basic movements in chess
module BasicMovement
  def initialize(board, piece, end_position)
    @board = board
    @piece = piece
    @initial_position = board.current_position(piece)
    @end_position = end_position
  end

  def valid?
    possible? && !blocked? # own color king not in check
  end

  def apply
    @board.data[@initial_position[0]][@initial_position[1]] = nil
    @board.data[@end_position[0]][@end_position[1]] = @piece
  end

  def allowing_en_passant?
    false
  end

  private

  def possible?
    @piece.basic_moves.each do |move|
      if reaches_position?(move)
        @move = move
        return true
      end
    end
    false
  end

  def blocked?
    blocked_on_transition? || blocked_on_arrival?
  end

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

  def vertical_or_horizontal?
    @end_position.zip(@initial_position).map { |finish, start| finish - start }.include?(0)
  end
end
