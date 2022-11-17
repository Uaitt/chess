# frozen_string_literal: true

# this class represents the board in chess
class Board
  attr_accessor :data, :last_movement

  def initialize
    @data = Array.new(8) { Array.new(8) }
  end

  def set
    @data.map!.with_index do |row, rank|
      row.map.with_index do |_, file|
        Piece.for(rank, file)
      end
    end
  end

  def current_position(piece)
    @data.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        return [row_index, column_index] if square == piece
      end
    end
  end

  def piece_at(position)
    @data[position[0]][position[1]]
  end

  def place_piece(piece, position)
    @data[position[0]][position[1]] = piece
  end

  def at_least_a_valid_movement?(moving_piece)
    positions.any? do |position|
      movement = Movement.for(self, moving_piece, position)
      movement.valid? && !movement.checks_own_king?
    end
  end

  def checked?(color)
    king = king_of_color(color)
    @data.any? do |row|
      row.any? { |piece| BasicMovement.for(self, piece, current_position(king)).valid? }
    end
  end

  def mated?(color)
    king = king_of_color(color)
    king.basic_moves.all? { |move| BasicMovement.for(self, king, new_position(move, king)).checks_own_king? }
  end

  def stalemated?(color)
    !checked?(color) && no_legal_moves?(color)
  end

  def allowing_castling?(color, separating_positions, king_path)
    !checked?(color) && !opponent_can_attack_crossed_path(color, king_path) &&
      separating_positions.all? { |position| @data[position[0]][position[1]].instance_of?(NilPiece) }
  end

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

  def positions
    [0, 1, 2, 3, 4, 5, 6, 7].product([0, 1, 2, 3, 4, 5, 6, 7])
  end

  def new_position(move, piece)
    move.zip(current_position(piece)).map { |finish, start| finish + start }
  end

  def king_of_color(color)
    @data.each do |row|
      row.each { |piece| return piece if piece.color == color && piece.class.include?(King) }
    end
  end

  def no_legal_moves?(color)
    pieces_of_color(color).all? do |piece|
      positions.all? do |position|
        movement = Movement.for(self, piece, position)
        !movement.valid? || movement.checks_own_king?
      end
    end
  end

  def pieces_of_color(color)
    @data.map do |row|
      row.select do |piece|
        piece.color == color
      end
    end.flatten
  end

  def opponent_can_attack_crossed_path(color, king_path)
    @data.any? do |row|
      row.any? do |piece|
        piece.color != color && king_path.any? do |position|
          movement = BasicMovement.for(self, piece, position)
          movement.valid? && !movement.checks_own_king?
        end
      end
    end
  end

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
