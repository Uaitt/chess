# frozen_string_literal: true

require_relative 'castling'

# this class represents a special black castling movement in chess
class WhiteLongCastling
  include Castling

  private

  def rank
    7
  end

  def file
    0
  end

  def rook_class
    WhiteRook
  end

  def separating_positions
    [[7, 1], [7, 2], [7, 3]]
  end

  def king_path
    separating_positions[1..]
  end

  def new_rook_position
    [7, 3]
  end
end
