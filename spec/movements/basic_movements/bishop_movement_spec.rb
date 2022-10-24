# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/bishop_movement'
require_relative '../../../lib/pieces/bishop'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe BiShopMovement do
  subject(:bishop_movement) { described_class.new(board, bishop, end_position) }
  let(:bishop) { Bishop.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the movement is possible' do
      context 'when the bishop is placed in the top left corner' do
        before do
          board.data[0][0] = bishop
        end

        let(:end_position) { [1, 1] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 2] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [4, 4] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [7, 7] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end
      end

      context 'when the bishop is placed in a random position' do
        before do
          board.data[3][5] = bishop
        end

        let(:end_position) { [4, 6] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 6] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [5, 3] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [1, 3] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end
      end
    end

    context 'when the movement is not possible' do
      context 'when the bishop is placed in the top left corner' do
        before do
          board.data[0][0] = bishop
        end

        let(:end_position) { [1, 0] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [0, 1] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [1, 2] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [2, 1] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end
      end

      context 'when the bishop is placed in a random position' do
        before do
          board.data[3][5] = bishop
        end

        let(:end_position) { [5, 6] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [1, 6] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [6, 2] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [0, 4] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end
      end
    end
  end
end
