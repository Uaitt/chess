# frozen_string_literal: true

require_relative '../../../lib/pieces/rook/black_rook'

describe BlackRook do
  subject(:black_rook) { described_class.new }
  describe '::starts_at?' do
    context 'when given 0 and 0' do
      it 'returns true' do
        expect(BlackRook.starts_at?(0, 0)).to eq(true)
      end
    end

    context 'when given 0 and 7' do
      it 'returns true' do
        expect(BlackRook.starts_at?(0, 7)).to eq(true)
      end
    end

    context 'when given 0 and 4' do
      it 'returns false' do
        expect(BlackRook.starts_at?(0, 3)).to eq(false)
      end
    end

    context 'when given 2 and 0' do
      it 'returns true' do
        expect(BlackRook.starts_at?(2, 0)).to eq(false)
      end
    end

    context 'when given 5 and 0' do
      it 'returns true' do
        expect(BlackRook.starts_at?(5, 0)).to eq(false)
      end
    end

    context 'when given 2 and 1' do
      it 'returns false' do
        expect(BlackRook.starts_at?(1, 2)).to eq(false)
      end
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      rook_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
                    [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
                    [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7],
                    [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
      expect(black_rook.basic_moves.sort).to eq(rook_moves.sort)
    end
  end
end
