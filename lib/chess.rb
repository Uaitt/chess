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
    gets.chomp == 'new' ? setup : restore # to do later
    play
  end

  private

  def setup
    players_instruction
    add_players
    @board.set
  end

  def add_players
    user_choice = gets.chomp
    add_human(:first)
    user_choice == 'human' ? add_human(:second) : add_computer
  end

  def add_human(order)
    ask_for_name
    if order == :first
      @white_player = WhitePlayer.new(gets.chomp)
    else
      @black_player = BlackPlayer.new(gets.chomp)
    end
  end

  def add_computer
    @black_player = ComputerPlayer.new
  end

  def play
    loop do
      play_single_match
      finished_match_output
      break if gets.chomp != 'new'
    end
    final_greeting
  end

  def play_single_match
    loop do
      play_single_round
      break if @board.mated?(still_player.color) || @saved

      @round += 1
    end
    @saved ? saved_game_output : winner_greeting
  end

  def play_single_round
    playing_player.play_round
    checked_alarm if @board.checked?(still_player.color)
  end

  def playing_player
    @round.even? ? @white_player : @black_player
  end

  def still_player
    @round.even? ? @black_player : @white_player
  end
end
