# frozen_string_literal: true

require_relative 'piece'

# this class represents a non existing piece in chess
class NilPiece
  include Piece

  def self.starts_at?(_, _)
    true
  end
end
