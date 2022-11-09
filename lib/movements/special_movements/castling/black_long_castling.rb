# frozen_string_literal: true

require_relative 'castling'

# this class represents a special black castling movement in chess
class BlackLongCastling
  include Castling

  private

  def rank
    0
  end

  def file
    0
  end

  def separating_positions
    [[0, 1], [0, 2], [0, 3]]
  end

  def king_path
    separating_positions[1..]
  end

  def new_rook_position
    [0, 3]
  end
end