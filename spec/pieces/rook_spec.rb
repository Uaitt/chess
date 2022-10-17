# frozen_string_literal: true

require_relative '../../lib/pieces/rook'

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
end
