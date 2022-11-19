# frozen_string_literal: true

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
      print "  #{piece.symbol}  ".colorize(background: background_color(index_row, index_column),
                                           color: color(piece))
    end
    print ' '
  end

  def color(piece)
    piece.color == :black ? :black : :white
  end

  def background_color(index_row, index_column)
    light_cell(index_row, index_column) ? :light_blue : :blue
  end

  def light_cell(index_row, index_column)
    (index_row.even? && index_column.even?) || (index_row.odd? && index_column.odd?)
  end
end
