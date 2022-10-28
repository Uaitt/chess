# frozen_string_literal: true

require_relative '../../../lib/pieces/bishop/black_bishop'

describe BlackBishop do
  subject(:black_bishop) { described_class.new }

  describe '::starts_at?' do
    context 'when given 0 and 2' do
      it 'returns true' do
        expect(BlackBishop.starts_at?(0, 2)).to eq(true)
      end
    end

    context 'when given 0 and 5' do
      it 'returns true' do
        expect(BlackBishop.starts_at?(0, 5)).to eq(true)
      end
    end

    context 'when given 2 and 2' do
      it 'returns true' do
        expect(BlackBishop.starts_at?(2, 2)).to eq(false)
      end
    end

    context 'when given 5 and 5' do
      it 'returns true' do
        expect(BlackBishop.starts_at?(5, 5)).to eq(false)
      end
    end

    context 'when given 0 and 3' do
      it 'returns false' do
        expect(BlackBishop.starts_at?(0, 3)).to eq(false)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_bishop.color).to eq(:black)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      bishop_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
                      [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7],
                      [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
                      [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
      expect(black_bishop.basic_moves.sort).to eq(bishop_moves.sort)
    end
  end
end
