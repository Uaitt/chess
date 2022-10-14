# frozen_string_literal: true

require_relative '../../lib/pieces/knight'

describe Knight do
  subject(:knight) { described_class.new(:black) }
  describe '#reachable?' do
    context 'when the position is reachable' do
      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [4, 6])).to eq(true)
      end

      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [5, 5])).to eq(true)
      end

      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [1, 3])).to eq(true)
      end

      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [2, 2])).to eq(true)
      end

      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [4, 2])).to eq(true)
      end

      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [5, 3])).to eq(true)
      end

      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [1, 5])).to eq(true)
      end

      it 'returns true' do
        expect(knight.able_to_reach?([3, 4], [2, 6])).to eq(true)
      end
    end

    context 'when the position is not reachable' do
      it 'returns false' do
        expect(knight.able_to_reach?([3, 4], [1, 1])).to eq(false)
      end

      it 'returns false' do
        expect(knight.able_to_reach?([3, 4], [0, 0])).to eq(false)
      end

      it 'returns false' do
        expect(knight.able_to_reach?([3, 4], [7, 7])).to eq(false)
      end

      it 'returns false' do
        expect(knight.able_to_reach?([3, 4], [5, 4])).to eq(false)
      end

      # maybe has to be checked in play turn
      it 'returns false' do
        expect(knight.able_to_reach?([3, 4], [3, 4])).to eq(false)
      end
    end
  end

  describe '#meets_nobody?' do
    it 'always returns true' do
      expect(knight.meets_nobody?).to eq(true)
    end
  end
end
