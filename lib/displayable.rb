# frozen_string_literal: true

# ...
module Displayable
  def initial_instructions
    puts 'Welcome to CLI Chess!'
    puts 'This game can be played Human vs Human or Human vs Computer'
    puts 'Type \'yes\' if you want to play Human vs Human, anything else if you want to challenge a Computer'
  end
end
