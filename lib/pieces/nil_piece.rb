# frozen_string_literal: true

# this class represents a non existing piece
class NilPiece
  def self.starts_at?(_, _)
    true
  end

  def initialize
    nil
  end
end
