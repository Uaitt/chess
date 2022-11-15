# frozen_string_literal: true

# ...
module PlayerDisplay
  def initial_instructions
    puts "Please #{@name} enter your move (or 'save' if you want to save the game)"
  end

  def ask_for_start_coordinates
    puts 'Enter the coordinates of the piece you want to move'
  end

  def ask_for_end_coordinates
    puts 'Enter the coordinates of the square where you want to move your selected piece'
  end

  def invalid_coordinates
    puts 'Invalid coordinates, try again!'
  end
end
