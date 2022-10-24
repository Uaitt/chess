# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/rook_movement'
require_relative '../../../lib/board'
require_relative '../../../lib/pieces/rook'

describe RookMovement do
  subject(:rook_movement) { described_class.new(board, piece, end_position) }
  let(:piece) { Rook.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the movement is possible' do
      context 'when the rook is placed on the top-left corner' do
        before do
          board.data[0][0] = piece
        end

        let(:end_position) { [1, 0] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end

        let(:end_position) { [3, 0] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end

        let(:end_position) { [0, 1] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end

        let(:end_position) { [0, 2] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end
      end

      context 'when the rook is placed in a random position' do
        before do
          board.data[3][5] = piece
        end

        let(:end_position) { [3, 6] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end

        let(:end_position) { [3, 0] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end

        let(:end_position) { [0, 5] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end

        let(:end_position) { [5, 5] }
        it 'returns true' do
          expect(rook_movement.possible?).to eq(true)
        end
      end
    end

    context 'when the movement is not possible' do
      context 'when the rook is placed in the top left corner' do
        before do
          board.data[0][0] = piece
        end

        let(:end_position) { [1, 1] }
        it 'returns false' do
          expect(rook_movement.possible?).to eq(false)
        end

        let(:end_position) { [3, 1] }
        it 'returns false' do
          expect(rook_movement.possible?).to eq(false)
        end
      end

      context 'when the rook is placed in a random position' do
        before do
          board.data[1][6] = piece
        end

        let(:end_position) { [2, 7] }
        it 'returns false' do
          expect(rook_movement.possible?).to eq(false)
        end

        let(:end_position) { [4, 2] }
        it 'returns false' do
          expect(rook_movement.possible?).to eq(false)
        end
      end
    end
  end
=begin
  describe '#blocked?' do
    before do
      board.data[0][0] = piece
    end
    context 'when it is blocked by a'
=end
end
