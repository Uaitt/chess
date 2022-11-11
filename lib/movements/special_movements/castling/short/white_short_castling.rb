# frozen_string_literal: true

require_relative '../castling'

# this class represents a special black castling movement in chess
class WhiteShortCastling
  include Castling

  class << self
    def moving?(piece)
      piece.instance_of?(WhiteKing)
    end
  end

  private

  def rank
    7
  end

  def file
    7
  end

  def rook_class
    WhiteRook
  end

  def separating_positions
    [[7, 5], [7, 6]]
  end

  def king_path
    separating_positions
  end

  def new_rook_position
    [7, 5]
  end
end
