# frozen_string_literal: true

require_relative 'player_display'

# this class represents a human player that controls the white pieces
class WhiteHumanPlayer
  include PlayerDisplay

  def initialize(name, board)
    @name = name
    @board = board
    @color = :white
  end

  def play_round
    initial_instructions
    input_start_coordinates
    input_end_coordinates
    @movement.apply
  end

  private

  def input_start_coordinates
    loop do
      ask_for_start_coordinates
      @start_coordinates = Coordinates.new(gets.chomp)
      break if @start_coordinates.valid? && selected_existing_piece?

      invalid_coordinates
    end
  end

  def input_end_coordinates
    loop do
      ask_for_end_coordinates
      @end_coordinates = Coordinates.new(gets.chomp)
      break if @end_coordinates.valid? && selected_valid_movement?

      invalid_coordinates
    end
  end

  def selected_existing_piece?
    @piece = @board.piece_at(@start_coordinates.convert)
    @piece.class != NilPiece
  end

  def selected_valid_movement?
    @movement = Movement.for(@board, @piece, @end_coordinates.convert)
    @movement.valid?
  end
end
