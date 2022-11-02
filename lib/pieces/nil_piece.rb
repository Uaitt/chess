# frozen_string_literal: true

# this class represents a non existing piece in chess
class NilPiece
  attr_reader :color

  def self.starts_at?(_, _)
    true
  end
end
