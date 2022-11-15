# frozen_string_literal: true

require_relative '../displayable'

# this class represents a human player that controls the white pieces
class WhiteHumanPlayer
  include Displayable

  def initialize(name, board)
    @name = name
    @board = board
    @color = :white
  end

  def play_round
    puts "Please #{@name} enter your move (or 'save' if you want to save the game)"
    input_start_coordinates
    input_end_coordinates
    @movement.apply
  end

  def input_start_coordinates
    loop do
      puts 'Enter the coordinates of the piece you want to move'
      @start_coordinates = Coordinates.new(gets.chomp)
      break if @start_coordinates.valid? && selected_existing_piece?

      puts 'Invalid coordinates, try again!'
    end
  end

  def input_end_coordinates
    loop do
      puts 'Enter the coordinates of the square where you want to move your selected piece'
      @end_coordinates = Coordinates.new(gets.chomp)
      break if @end_coordinates.valid? && selected_valid_movement?

      puts 'Invalid coordinates, try again!'
    end
  end

  def selected_existing_piece?
    @piece = (@board.piece_at(@start_coordinates.convert).class != NilPiece)
  end

  def selected_valid_movement?
    @movement = Movement.for(@board, @piece, @end_coordinates.convert).valid?
  end
end
