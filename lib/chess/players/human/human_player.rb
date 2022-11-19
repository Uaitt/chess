# frozen_string_literal: true

require_relative '../../display/player_display'

# set of methods common to all human players in chess
module HumanPlayer
  include PlayerDisplay

  attr_reader :color, :type

  def initialize(name, board)
    @name = name
    @type = :human
    @board = board
  end

  def play_round
    round_instructions
    input_start_coordinates
    return if wants_to_save?

    input_end_coordinates
    @movement.apply
  end

  def wants_to_save?
    @start_coordinates.data == 'save'
  end

  private

  def input_start_coordinates
    loop do
      ask_for_start_coordinates
      @start_coordinates = Coordinates.new(gets(chomp: true))
      break if wants_to_save? || (@start_coordinates.valid? && selected_valid_piece?)

      invalid_coordinates(:start)
    end
  end

  def input_end_coordinates
    new_line
    loop do
      ask_for_end_coordinates
      @end_coordinates = Coordinates.new(gets(chomp: true))
      break if @end_coordinates.valid? && selected_valid_movement?

      invalid_coordinates(:end)
    end
  end

  def selected_valid_piece?
    @piece = @board.piece_at(@start_coordinates.convert)
    @piece.class != NilPiece && @piece.color == color && @board.at_least_a_valid_movement?(@piece)
  end

  def selected_valid_movement?
    @movement = Movement.for(@board, @piece, @end_coordinates.convert)
    @movement.valid? && !@movement.checks_own_king?
  end
end
