# frozen_string_literal: true

require_relative '../white_piece'
require_relative 'queen'

# this class represents a white queen in chess
class WhiteQueen < WhitePiece
  include Queen

  def self.starts_at?(rank, file)
    rank == 7 && file == 3
  end
end
