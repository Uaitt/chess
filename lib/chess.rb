# frozen_string_literal: true

require_relative 'displayable'

# this class represents the game of chess
class Chess
  include Displayable

  def initialize
    @board = Board.new
    # @serializer = Serializer.new
  end

  def start
    initial_instructions
    gets.chomp == 'new' ? setup : restore
    play
  end

  private

  def setup
    players_instruction
    add_players
  end

  def add_players
    user_choice = gets.chomp
    add_human(:first)
    user_choice == 'human' ? add_human(:second) : add_computer
  end

  def add_human(order)
    ask_for_name
    if order == :first
      @white_player = WhiteHumanPlayer.new(gets.chomp)
    else
      @black_player = BlackHumanPlayer.new(gets.chomp)
    end
  end

  def add_computer
    @black_player = ComputerPlayer.new
  end

  def play
    loop do
      single_match
      @saved ? saved_match_output : finished_match_output
      break if @saved || gets.chomp != 'new'
    end
    final_greeting
  end

  def single_match
    @board.set
    loop do
      single_round
      break if @board.mated?(still_player.color) || current_player.wants_to_save?

      @round += 1
    end
    current_player.wants_to_save? ? save_game : winner_greeting
  end

  def single_round
    @board.show
    current_player.play_round
    checked_alarm if @board.checked?(still_player.color)
  end

  def current_player
    @round.even? ? @white_player : @black_player
  end

  def still_player
    @round.even? ? @black_player : @white_player
  end
end
