# frozen_string_literal: true

require_relative '../rook/rook_basic_moves'
require_relative '../bishop/bishop_basic_moves'

# this class represents a queen in chess
module QueenBasicMoves
  include RookBasicMoves
  include BishopBasicMoves

  def basic_moves
    RookBasicMoves.instance_method(:basic_moves).bind(self).call +
      BishopBasicMoves.instance_method(:basic_moves).bind(self).call
  end
end
