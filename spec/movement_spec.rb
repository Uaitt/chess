# frozen_string_literal: true

require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/rook'
require_relative '../lib/board'
require_relative '../lib/basic_movement'

describe BasicMovement do
  subject(:basic_movement) { described_class.new(board, piece, end_position) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when a rook is moving' do
      let(:piece) { Rook.new(:black) }
      before do
        board.data[0][0] = piece
      end

      context 'when the movement is possible' do
        let(:end_position) { [1, 0] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 0] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [0, 7] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end
      end

      context 'when the movement is not possible' do
        let(:end_position) { [1, 1] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [3, 3] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [1, 6] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end
      end
    end
  end
end
