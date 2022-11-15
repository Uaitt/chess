# frozen_string_literal: true

require_relative 'human_player'

# this class represents a human player that controls the black pieces
class BlackHumanPlayer
  include HumanPlayer

  def initialize(name, board)
    super
    @color = :black
  end
end
