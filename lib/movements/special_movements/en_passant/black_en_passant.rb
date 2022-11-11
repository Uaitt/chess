# frozen_string_literal: true

require_relative 'en_passant'

# this class represents a special black en passant movement in chess
class BlackEnPassant
  include EnPassant

  class << self
    def moving?(piece)
      piece.instance_of?(BlackPawn)
    end
  end

  private

  def valid_end_position?
    @end_position[0] == 5 &&
      @end_position[1] == @initial_position[1] + 1 || @end_position[1] == @initial_position[1] - 1
  end

  def right_rank?
    @initial_position[0] == 4
  end

  def next_to_enemy_pawn?
    @left_piece.instance_of?(WhitePawn) || @right_piece.instance_of?(WhitePawn)
  end

  def enemy_pawn
    @left_piece.instance_of?(WhitePawn) ? @left_piece : @right_piece
  end
end
