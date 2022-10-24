# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/knight_movement'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/pieces/rook'
require_relative '../../../lib/board'

describe KnightMovement do
  subject(:bishop_movement) { described_class.new(board, bishop, end_position) }
  let(:knight) { Knight.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the movement is possible' do
      context 'when the knight is placed in the top left corner' do
        before do
          board.data[0][0] = knight
        end

        let(:end_position) { [1, 2] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 1] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

      context 'when the knight is placed in a random position' do
        before do
          board.data[3][4] = knight
        end


      end
    end
  end
end
