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

  def show
    @data.each_with_index do |row, index|
      print 8 - index
      show_row(row, index)
    end
    puts 'a b c c d f g h'
  end

  def current_position(piece)
    @data.each_with_index do |row, row_index|
      row.each_with_index do |square, column_index|
        return [row_index, column_index] if square == piece
      end
    end
  end

  def piece_at(position)
    @data[position[0]][position[1]] # need test
  end

  def place_piece(piece, position)
    @data[position[0]][position[1]] = piece # need test
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

  def allowing_castling?(color, separating_positions, king_path)
    !checked?(color) && !opponent_can_attack_crossed_path(color, king_path) &&
      separating_positions.all? { |position| @data[position[0]][position[1]].instance_of?(NilPiece) }
  end

  private

  def new_position(move, piece)
    move.zip(current_position(piece)).map { |finish, start| finish + start }
  end

  def king_of_color(color)
    @data.each do |row|
      row.each { |piece| return piece if piece.color == color && piece.class.include?(King) }
    end
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

  # black background : "\e[40m#{self}\e[0m"
  # brown background : "\e[43m#{self}\e[0m"
  def show_row(row, index)
    row.each do |piece|
      print "\e[#{color}m#{piece.symbol}\e[0m"
    end
    puts ""
  end

  def color
    
end
