# frozen_string_literal: true

require_relative '../display/player_display'

# this class represents am AI computer player that controls the black pieces in chess
class ComputerPlayer
  include PlayerDisplay

  attr_reader :color, :type

  def initialize(board)
    @color = :black
    @type = :computer
    @board = board
  end

  def play_round
    round_statement
    selected_movement = @board.valid_movements(:black).sample
    selected_movement.apply
  end

  def wants_to_save?
    false
  end
end
