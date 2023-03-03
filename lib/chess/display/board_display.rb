# frozen_string_literal: true

require 'pry-byebug'

# set of methods that display the board in chess
module BoardDisplay
  def show
    system 'clear'
    puts '    a    b    c    d    e    f    g    h'.colorize(color: :white)
    @data.each_with_index do |row, index|
      print "#{8 - index} ".colorize(color: :white)
      show_row(row, index)
      puts "#{8 - index} ".colorize(color: :white)
    end
    puts '    a    b    c    d    e    f    g    h'.colorize(color: :white)
  end

  private

  def show_row(row, index_row)
    row.each_with_index do |piece, index_column|
      print "\033[48;2;#{background_color(index_row, index_column)}m\033[#{color(piece)}m  #{piece.symbol}   \033[0m"
      #print "  #{piece.symbol}  ".colorize(background: background_color(index_row, index_column),
      #                                    color: color(piece))
    end
    print ' '
  end

  def color(piece)
    piece.color == :black ? 30 : 37
  end

  def background_color(index_row, index_column)
    light_cell(index_row, index_column) ? "255;204;116" : "87;58;46"
  end

  def light_cell(index_row, index_column)
    (index_row.even? && index_column.even?) || (index_row.odd? && index_column.odd?)
  end
end
