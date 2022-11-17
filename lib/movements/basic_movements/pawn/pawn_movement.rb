# frozen_string_literal: true

require_relative '../basic_movement'
require_relative '../rook/rook_movement'
require_relative '../bishop/bishop_movement'

# set of methods common to all pawn movements in chess
module PawnMovement
  include BasicMovement

  def valid?
    @piece.basic_moves.each_with_index do |move, count|
      return true if reaches_position?(move) && environment_allows?(count)
    end
    false
  end

  def direction
    rook_or_bishop_movement.instance_method(:direction).bind(self).call
  end

  def apply(board)
    super
    promote_pawn if allowing_promotion?
  end

  private

  def environment_allows?(count)
    arrival_allows?(count) && turn_allows?(count)
  end

  def arrival_allows?(count)
    count.zero? || count == 1 ? !blocked_vertically? : blocked_diagonally?
  end

  def turn_allows?(count)
    count.zero? ? !already_happened? : true
  end

  def blocked_vertically?
    blocked_on_transition? || blocked_on_arrival?
  end

  def blocked_diagonally?
    !@board.piece_at(@end_position).instance_of?(NilPiece) &&
      @board.piece_at(@end_position).color != @piece.color
  end

  def already_happened?
    @initial_position[0] != (@piece.color == :black ? 1 : 6)
  end

  def blocked_on_arrival?
    !@board.data[@end_position[0]][@end_position[1]].instance_of?(NilPiece)
  end

  def promote_pawn
    promote_piece
    @board.place_piece(@promoted_piece_class.new, @end_position)
  end

  def promote_piece
    puts 'Your pawn can be promoted, choose the new piece'
    loop do
      input = gets.chomp.split.map(&:capitalize).join('').gsub(/\s+/, '')
      @promoted_piece_class = Module.const_get(input)
      break if correct_class?

      puts 'You can\'t choose this piece'
    end
  end
end
