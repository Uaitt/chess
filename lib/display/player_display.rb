# frozen_string_literal: true

# set of methods that display messages to the players in chess
module PlayerDisplay
  def round_instructions
    puts ''
    puts "Please #{@name} enter your move (or '#{'save'.colorize(color: :light_blue)}' if you want to save the game)"
    puts ''
  end

  def ask_for_start_coordinates
    puts 'Enter the coordinates of the piece you want to move'
  end

  def ask_for_end_coordinates
    puts 'Enter the coordinates of the square where you want to move your selected piece'
  end

  def invalid_start_coordinates
    puts ''
    print "#{'Invalid coordinates!'.colorize(color: :light_red)} "
    puts cause_of_invalid_start_coordinates
    puts ''
  end

  def cause_of_invalid_start_coordinates
    return 'They are out of bound!' unless @start_coordinates.valid?

    return 'Non existing piece!' if @piece.instance_of?(NilPiece)

    return 'You can\'t move an opponent piece!' if @piece.color != color

    return 'This piece does not have a valid movement!' unless @board.at_least_a_valid_movement?(@piece)
  end

  def invalid_coordinates
    puts 'Invalid coordinates, try again!'
  end
end
