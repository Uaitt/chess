# frozen_string_literal: true

require_relative 'castling'

# this class represents a special black castling movement in chess
class BlackShortCastling
  include Castling

  private

  def rank
    0
  end

  def file
    7
  end

  def rook_class
    BlackRook
  end

  def separating_positions
    [[0, 5], [0, 6]]
  end

  def king_path
    separating_positions
  end

  def new_rook_position
    [0, 5]
  end
end
