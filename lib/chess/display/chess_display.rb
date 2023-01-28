# frozen_string_literal: true

# set of methods that display messages during a chess game
module ChessDisplay
  def initial_instructions
    system 'clear'
    puts ''
    puts 'Welcome to CLI Chess!'
    puts ''
    print "Type '#{'new'.colorize(color: :light_blue, mode: :bold)}' if you want to play a game from scratch,\n"
    puts "'#{'anything else'.colorize(color: :light_blue, mode: :bold)}' if you want to load a saved game"
    puts ''
  end

  def players_instruction
    puts ''
    print "#{'Be aware'.colorize(color: :light_red, mode: :bold)} that first player color will be white,\n"
    puts 'second player color will be black'
    puts ''
    print "Type '#{'human'.colorize(color: :light_blue, mode: :bold)}' if you want to play Human vs Human,\n"
    puts  "'#{'anything else'.colorize(color: :light_blue, mode: :bold)}' if you want to challenge a Computer"
    puts ''
  end

  def ask_for_name(order)
    system 'clear'
    puts ''
    puts "Enter the name of the #{order} player"
    puts ''
  end

  def finished_match_output
    @board.show
    @saved ? saved_match_output : won_or_tie_match_output
  end

  def saved_match_output
    puts ''
    puts 'The game has successfully been saved'.colorize(color: :green, mode: :bold)
  end

  def won_or_tie_match_output
    @board.mated?(still_player.color) ? winner_greeting : tie_game_output
    puts ''
    puts 'The game has ended'
    puts ''
    ask_for_new_match
  end

  def final_greeting
    system 'clear'
    @board.show
    puts ''
    puts 'Thanks for playing'
    puts 'We hope you enjoyed the game, see you soon!'
    puts ''
  end

  def winner_greeting
    puts ''
    if winner.type == :human
      print "#{winner.color.capitalize} has checkmated #{loser.color}! #{'Congratulation'.colorize(color: :green,
                                                                                                   mode: :bold)}"
      puts " #{winner.name.colorize(color: :green, mode: :bold)} for winning!"
    else
      puts 'Black has checkmated white! You just lost to a computer, loser!'
    end
  end

  def tie_game_output
    puts 'Game resulted in a tie, how unlucky!'
  end

  def ask_for_new_match
    print "Type '#{'new'.colorize(color: :light_blue, mode: :bold)}' if you want to play a new game,\n"
    puts  "'#{'anything else'.colorize(color: :light_blue, mode: :bold)}' if you want to quit"
    puts ''
  end

  def winner
    @round.even? ? @white_player : @black_player
  end

  def loser
    @round.even? ? @black_player : @white_player
  end

  def no_saved_games_warning
    puts ''
    puts "#{'No game has been saved'.colorize(color: :light_red, mode: :bold)}. You are going to play a new one!"
  end

  def restore_instructions
    puts ''
    puts 'Select one game that you want to restore (full name needed)'
    puts ''
    saved_games
  end

  def saved_games
    Dir['saved_games/*'].each do |file|
      puts file.delete_prefix('saved_games/').delete_suffix('.txt')
      puts ''
    end
  end

  def non_existing_saved_game_warning
    puts ''
    puts "#{'Non existing saved game!'.colorize(color: :light_red, mode: :bold)} Enter an existing one "
    puts ''
  end

  def save_game_instructions
    puts ''
    puts 'Enter a name that will help recognize this saved game'
    puts ''
  end

  def same_name_saved_game_warning
    puts ''
    puts "#{'A saved game with the same name already exists'.colorize(color: :light_red,
                                                                      mode: :bold)}, please enter a different one"
    puts ''
  end
end
