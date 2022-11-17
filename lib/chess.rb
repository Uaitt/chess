# frozen_string_literal: true

require_relative 'serialize'
require_relative 'display'

# this class represents the game of chess
class Chess
  include Serialize
  include Display

  def initialize
    @board = Board.new
  end

  def start
    initial_instructions
    gets.chomp == 'new' ? setup : try_to_restore
    play
  end

  private

  def setup
    players_instruction
    add_players
    @round = 0
    @board.set
  end

  def try_to_restore
    if Dir.exist?('saved_games')
      restore
    else
      no_saved_games_warning
      setup
    end
  end

  def restore
    restore_instructions
    saved_game = input_path

    from_marshal(File.read(saved_game))
    delete(saved_game)
  end

  def add_players
    user_choice = gets.chomp
    add_human(:first)
    user_choice == 'human' ? add_human(:second) : add_computer
  end

  def add_human(order)
    ask_for_name(order)
    if order == :first
      @white_player = WhiteHumanPlayer.new(gets.chomp, @board)
    else
      @black_player = BlackHumanPlayer.new(gets.chomp, @board)
    end
  end

  def add_computer
    @black_player = ComputerPlayer.new
  end

  def play
    loop do
      single_match
      finished_match_output
      break if @saved || gets.chomp != 'new'
    end
    final_greeting
  end

  def single_match
    loop do
      single_round
      break if finished_game?

      @round += 1
    end
    current_player.wants_to_save? ? save : winner_greeting
  end

  def single_round
    @board.show
    current_player.play_round
    checked_alarm if @board.checked?(still_player.color)
  end

  def finished_game?
    current_player.wants_to_save? || @board.mated?(still_player.color) || @board.stalemated?(still_player.color)
  end

  def save
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    File.open(file_name, 'w') { |file| file.write(to_marshal) }
    @saved = true
  end

  def current_player
    @round.even? ? @white_player : @black_player
  end

  def still_player
    @round.even? ? @black_player : @white_player
  end
end
