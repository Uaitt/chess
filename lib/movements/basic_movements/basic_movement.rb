# frozen_string_literal: true

# set of common methods to all basic movements in chess
module BasicMovement
  class << self
    def for(board, piece, king_position)
      registry.find { |movement| movement.handles?(piece) }.new(board, piece, king_position)
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

  def initialize(board, piece, end_position)
    @board = board
    @piece = piece
    @initial_position = @board.current_position(piece)
    @end_position = end_position
  end

  def valid?
    possible? && !blocked?
  end

  def checks_own_king?
    return true if !valid_position?(@end_position)

    @board = @board.dup
    @board.data = @board.data.map(&:clone)
    apply
    @board.checked?(@piece.color)
  end

  def valid_position?(position)
    position[0] >= 0 && position[0] <= 7 &&
      position[1] >= 0 && position[1] <= 7
  end

  def apply
    @board.data[@initial_position[0]][@initial_position[1]] = NilPiece.new
    @board.data[@end_position[0]][@end_position[1]] = @piece
  end

  def allows_en_passant?(pawn)
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
    @current_position = @initial_position.zip(direction).map(&:sum)
    until @current_position == @end_position
      return true unless @board.data[@current_position[0]][@current_position[1]].instance_of?(NilPiece)

      @current_position = @current_position.zip(direction).map(&:sum)
    end
    false
  end

  def blocked_on_arrival?
    !@board.data[@end_position[0]][@end_position[1]].instance_of?(NilPiece) &&
      @board.data[@end_position[0]][@end_position[1]].color == @piece.color
  end

  def vertical_or_horizontal?
    @end_position.zip(@initial_position).map { |finish, start| finish - start }.include?(0)
  end

  def current_move
    @end_position.zip(@initial_position).map { |finish, start| finish - start }
  end
end
