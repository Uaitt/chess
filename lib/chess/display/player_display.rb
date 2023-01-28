# frozen_string_literal: true

# set of methods that display messages to the players in chess
module PlayerDisplay
  def round_instructions
    puts ''
    puts "\t\t #{@color.capitalize} Turn".colorize(color: :light_blue, mode: :bold)
    checked_alarm if @board.checked?(@color)
    puts ''
    puts "Please #{@name} enter your move (or '#{'save'.colorize(color: :light_blue, mode: :bold)}' if you want to save the game)"
    puts ''
  end

  def ask_for_start_coordinates
    puts 'Enter the coordinates of the piece you want to move'
    puts ''
  end

  def ask_for_end_coordinates
    puts "You are moving #{@start_coordinates.data}"
    puts ''
    puts 'Enter the coordinates of the square where you want to move your selected piece'
    puts ''
  end

  def invalid_coordinates(order)
    @board.show
    round_instructions
    puts "#{'Invalid coordinates!'.colorize(color: :light_red, mode: :bold)} #{cause_of_invalid_coordinates(order)}"
    puts ''
  end

  def cause_of_invalid_coordinates(order)
    order == :start ? cause_of_invalid_start_coordinates : cause_of_invalid_end_coordinates
  end

  def cause_of_invalid_start_coordinates
    return 'They are out of bound!' unless @start_coordinates.valid?

    return 'Non existing piece!' if @piece.instance_of?(NilPiece)

    return 'You can\'t move an opponent piece!' if @piece.color != color

    return 'This piece does not have a valid movement!' unless @board.at_least_a_valid_movement?(@piece)
  end

  def cause_of_invalid_end_coordinates
    return 'They are out of bound!' unless @end_coordinates.valid?

    return 'This piece can\'t make this movement!' unless @movement.valid?

    return 'This movement would put your king in check!' if @movement.checks_own_king?
  end

  def promotion_instructions
    puts 'Your pawn can be promoted, choose the new piece between'
    puts ''
    puts "#{@piece.color} queen\n\n#{@piece.color} rook\n\n#{@piece.color} bishop\n\n#{@piece.color} knight"
    puts ''
  end

  def invalid_promotion_warning
    puts ''
    puts "#{'Invalid piece!'.colorize(color: :light_red, mode: :bold)}! Please choose a valid piece!"
    puts ''
  end

  def round_statement
    puts ''
    puts "\t\t #{@color.capitalize} Turn".colorize(color: :light_blue, mode: :bold)
    checked_alarm if @board.checked?(@color)
    puts ''
    puts 'The computer is choosing which move to make'
    puts ''
    sleep(1.5)
    puts ''
  end

  def checked_alarm
    puts ''
    puts "WARNING #{@color}'s king is currently in check!".colorize(color: :light_red, mode: :bold)
  end
end
