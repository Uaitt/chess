# frozen_string_literal: true

require_relative '../movement'

# set of common methods to all special movements in chess
module SpecialMovement
  include Movement

  class << self
    def for(board, piece, end_position)
      registry.find { |movement| movement.moving?(piece, end_position) }.new(board, piece, end_position)
    end

    private

    def registry
      black_registry + white_registry + [NilMovement]
    end

    def black_registry
      [BlackEnPassant, BlackLongCastling, BlackShortCastling]
    end

    def white_registry
      [WhiteEnPassant, WhiteLongCastling, WhiteShortCastling]
    end
  end
end
