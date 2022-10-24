# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/knight_movement'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/pieces/rook'
require_relative '../../../lib/board'

describe KnightMovement do
  subject(:knight_movement) { described_class.new(board, knight, end_position) }
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
      end

      context 'when the knight is placed in a random position' do
        before do
          board.data[3][4] = knight
        end

        let(:end_position) { [4, 6] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [5, 5] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [1, 3] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 2] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [4, 2] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [5, 3] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [1, 5] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 6] }
        it 'returns true' do
          expect(knight_movement.possible?).to eq(true)
        end
      end
    end

    context 'when the movement is not possible' do
      context 'when the knight is placed in the top left corner' do
        before do
          board.data[0][0] = knight
        end

        let(:end_position) { [1, 0] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end

        let(:end_position) { [0, 1] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end

        let(:end_position) { [1, 1] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end
      end

      context 'when the knight is placed in a random position' do
        before do
          board.data[3][4] = knight
        end

        let(:end_position) { [5, 4] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end

        let(:end_position) { [2, 1] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end

        let(:end_position) { [4, 3] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end

        let(:end_position) { [6, 3] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end

        let(:end_position) { [5, 6] }
        it 'returns false' do
          expect(knight_movement.possible?).to eq(false)
        end
      end
    end
  end
end
