# frozen_string_literal: true

require_relative 'chess/serialize'
require_relative 'chess/display/chess_display'

# this class represents the game of chess
class Chess
  include ChessDisplay
  include Serialize

  def initialize
    @board = Board.new
  end

  def start
    initial_instructions
    gets(chomp: true) == 'new' ? setup : try_to_restore
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
    user_choice = gets(chomp: true)
    add_human(:first)
    user_choice == 'human' ? add_human(:second) : add_computer
  end

  def add_human(order)
    ask_for_name(order)
    if order == :first
      @white_player = WhiteHumanPlayer.new(gets(chomp: true), @board)
    else
      @black_player = BlackHumanPlayer.new(gets(chomp: true), @board)
    end
  end

  def add_computer
    @black_player = ComputerPlayer.new(@board)
  end

  def play
    loop do
      single_match
      finished_match_output
      break if @saved || gets(chomp: true) != 'new'
    end
    final_greeting
  end

  def single_match
    loop do
      single_round
      break if match_ended?

      @round += 1
    end
    save if current_player.wants_to_save?
  end

  def single_round
    @board.show
    current_player.play_round
  end

  def match_ended?
    current_player.wants_to_save? || @board.mated?(still_player.color) || @board.stalemated?(still_player.color)
  end

  def save
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    File.write(file_name, to_marshal)
    @saved = true
  end

  def current_player
    @round.even? ? @white_player : @black_player
  end

  def still_player
    @round.even? ? @black_player : @white_player
  end
end
