# frozen_string_literal: true

require_relative 'en_passant'

# this class represents a special black en passant movement in chess
class WhiteEnPassant
  include EnPassant

  class << self
    def moving?(piece)
      piece.instance_of?(WhitePawn)
    end
  end

  private

  def valid_end_position?
    @end_position[0] == 2 &&
      @end_position[1] == @initial_position[1] + 1 || @end_position[1] == @initial_position[1] - 1
  end

  def right_rank?
    @initial_position[0] == 3
  end

  def next_to_enemy_pawn?
    @left_piece.instance_of?(BlackPawn) || @right_piece.instance_of?(BlackPawn)
  end

  def enemy_pawn
    @left_piece.instance_of?(BlackPawn) ? @left_piece : @right_piece
  end
end
