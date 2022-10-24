# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/queen_movement'
require_relative '../../../lib/pieces/queen'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe QueenMovement do
  subject(:queen_movement) { described_class.new(board, queen, end_position) }
  let(:queen) { Queen.new(:black) }
  let(:board) { Board.new }

  describe '#possible?' do
    context 'when the queen is placed at the top right corner' do
    end
  end
end
