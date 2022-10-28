# frozen_string_literal: true

require_relative '../black_piece'
require_relative 'bishop'

# this class represents a black bishop in chess
class BlackBishop < BlackPiece
  include Bishop

  def self.starts_at?(rank, file)
    rank.zero? && [2, 5].include?(file)
  end
end
