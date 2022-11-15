# frozen_string_literal: true

require_relative 'human_player'

# this class represents a human player that controls the white pieces
class WhiteHumanPlayer
  include HumanPlayer

  def initialize(name, board)
    super
    @color = :white
  end
end
