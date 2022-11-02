# frozen_string_literal: true

require_relative 'en_passant'

# this class represents a special black en passant movement in chess
class BlackEnPassant
  include EnPassant

  private

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
