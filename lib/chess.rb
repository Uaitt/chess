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
    gets.chomp == 'new' ? setup : restore_game # to do later
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
end
