# frozen_string_literal: true

require_relative '../movement'

# set of common methods to all basic movements in chess
module BasicMovement
  include Movement

  class << self
    def for(board, piece, end_position)
      registry.find { |movement| movement.moving?(piece) }.new(board, piece, end_position)
    end

    private

    def registry
      black_registry + white_registry + [NilMovement]
    end

    def black_registry
      [BlackBishopMovement, BlackKingMovement, BlackKnightMovement,
       BlackPawnMovement, BlackQueenMovement, BlackRookMovement]
    end

    def white_registry
      [WhiteBishopMovement, WhiteKingMovement, WhiteKnightMovement,
       WhitePawnMovement, WhiteQueenMovement, WhiteRookMovement]
    end
  end

  def valid?
    possible? && !blocked?
  end

  def double_moving?(pawn)
    @piece == pawn && [[2, 0], [-2, 0]].include?(current_move)
  end

  private

  def possible?
    @piece.basic_moves.each do |move|
      return true if reaches_position?(move)
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
    @current_position = @initial_position.zip(direction).map { |finish, start| finish + start }
    until @current_position == @end_position
      return true unless @board.piece_at(@current_position).instance_of?(NilPiece)

      @current_position = @current_position.zip(direction).map { |finish, start| finish + start }
    end
    false
  end

  def blocked_on_arrival?
    !@board.piece_at(@end_position).instance_of?(NilPiece) &&
      @board.piece_at(@end_position).color == @piece.color
  end

  def rook_or_bishop_movement
    if @end_position.zip(@initial_position).map { |finish, start| finish - start }.include?(0)
      RookMovement
    else
      BishopMovement
    end
  end

  def current_move
    @end_position.zip(@initial_position).map { |finish, start| finish - start }
  end

  def in_bound?
    @end_position[0] >= 0 && @end_position[0] <= 7 &&
      @end_position[1] >= 0 && @end_position[1] <= 7
  end
end
