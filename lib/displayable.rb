# frozen_string_literal: true

# ...
module Displayable
  def initial_instructions
    puts 'Welcome to CLI Chess!'
    puts 'This game can be played Human vs Human or Human vs Computer'
    puts 'Type \'new\' if you want to play a game from scratch, anything else if you want to load a saved game'
  end

  def players_instruction
    puts 'Be aware that first player color will be white, second player color will be black'
    puts 'Type \'human\' if you want to play Human vs Human, anything else if you want to challenge a Computer'
  end

  def ask_for_name
    puts "Enter the name of the #{order} player"
  end

  def finished_match_output
    puts 'The game has ended'
    puts 'Type \'new\' if you want to play a new game, anything else if you want to quit'
  end

  def final_greeting
    puts 'Thanks for playing!'
    puts 'We hope you enjoyed the game, see you soon!'
  end

  def saved_game_output
    puts 'The game has been successfully been saved'
  end

  def winner_greeting
    puts "Congratulation #{winner_name} for winning the game!"
  end

  def winner_name
    @round.even? ? @white_player.name : @black_player.name
  end

  def checked_alarm
    puts "#{still_player.color}'s king is currently in check!"
  end
end
