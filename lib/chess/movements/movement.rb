# frozen_string_literal: true

# set of common methods to all movements in chess
module Movement
  class << self
    def for(board, piece, end_position)
      [BasicMovement, SpecialMovement].each do |movement_namespace|
        movement = movement_namespace.for(board, piece, end_position)
        return movement if movement.valid?
      end

      NilMovement.new(board, piece, end_position)
    end
  end

  def initialize(board, piece, end_position)
    @board = board
    @piece = piece
    @initial_position = @board.current_position(piece)
    @end_position = end_position
  end

  def checks_own_king?
    return true unless in_bound?

    duplicate_board
    fake_apply
    @duplicated_board.checked?(@piece.color)
  end

  def apply
    @piece.movements += 1
    @board.place_piece(NilPiece.new, @initial_position)
    @board.place_piece(@piece, @end_position)
    @board.last_movement = self
  end

  private

  def fake_apply
    @duplicated_board.place_piece(NilPiece.new, @initial_position)
    @duplicated_board.place_piece(@piece, @end_position)
  end

  def duplicate_board
    @duplicated_board = @board.dup
    @duplicated_board.data = @board.data.map(&:dup)
  end

  def in_bound?
    @end_position[0] >= 0 && @end_position[0] <= 7 &&
      @end_position[1] >= 0 && @end_position[1] <= 7
  end
end
