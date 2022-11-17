# frozen_string_literal: true

# set of methods that display messages to the players in chess
module Display
  def initial_instructions
    puts ''
    puts 'Welcome to CLI Chess!'
    puts ''
    print "Type '#{'new'.colorize(color: :light_blue)}' if you want to play a game from scratch,\n"
    puts "'#{'anything else'.colorize(color: :light_blue)}' if you want to load a saved game"
    puts ''
  end

  def players_instruction
    puts ''
    print "#{'Be aware'.colorize(color: :yellow)} that first player color will be white,\n"
    puts 'second player color will be black'
    puts ''
    print "Type '#{'human'.colorize(color: :light_blue)}' if you want to play Human vs Human,\n"
    puts  "'#{'anything else'.colorize(color: :light_blue)}' if you want to challenge a Computer"
    puts ''
  end

  def ask_for_name(order)
    puts ''
    puts "Enter the name of the #{order} player"
    puts ''
  end

  def finished_match_output
    @saved ? saved_match_output : won_or_tie_match_output
  end

  def saved_match_output
    puts ''
    puts 'The game has successfully been saved'
  end

  def won_or_tie_match_output
    puts ''
    puts 'The game has ended'
    print "Type '#{'new'.colorize(color: :light_blue)}' if you want to play a new game,\n"
    puts  "'#{'anything else'.colorize(color: :light_blue)}' if you want to quit"
  end

  def final_greeting
    puts ''
    puts 'Thanks for playing!'
    puts 'We hope you enjoyed the game, see you soon!'
    puts ''
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

  def round_instructions
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

  def no_saved_games_warning
    puts 'No game has been saved. You are going to play a new one!'
  end

  def restore_instructions
    puts 'Select one game that you want to restore'
    saved_games
  end

  def saved_games
    Dir['saved_games/*'].each { |file| puts file.delete_prefix('saved_games/').delete_suffix('.txt') }
  end

  def non_existing_saved_game_warning
    puts 'Non existing saved game, enter a new one:'
  end

  def save_game_instructions
    puts 'Enter a name that will help recognize this saved game:'
  end

  def same_name_saved_game_warning
    puts 'A saved game with the same name already exists, please enter a different one:'
  end
end
