# frozen_string_literal: true

require_relative '../../lib/pieces/knight'
require_relative '../../lib/pieces/rook'
require_relative '../../lib/board'

describe Rook do
  subject(:rook) { described_class.new(:color) }
  describe '#able_to_reach?' do
    context 'when the position is reachable' do
      it 'returns true' do
        expect(rook.able_to_reach?([0, 0], [1, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([0, 0], [2, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([0, 0], [3, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([1, 1], [2, 1])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([1, 1], [7, 1])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([3, 3], [6, 3])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([2, 6], [2, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([7, 7], [0, 7])).to eq(true)
      end
    end

    context 'when the position is not reachable' do
      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [1, 1])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [3, 3])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [8, 3])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [2, 2])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([3, 3], [5, 5])).to eq(false)
      end
    end
  end

  describe '#not_blocked?' do
    let(:board) { Board.new }
    let(:data) { board.instance_variable_get(:@data) }
    before do
      data[0][0] = rook
    end
    context 'when it is not blocked by any piece' do
      it 'returns true' do
        expect(rook.not_blocked?(board, [0, 0], [5, 0])).to eq(true)
      end
    end

    context 'when it is blocked by a piece of the same color' do
      it 'returns false' do
        data[2][0] = Knight.new(:white)
        expect(rook.not_blocked?(board, [0, 0], [5, 0])).to eq(false)
      end
    end
  end
end
