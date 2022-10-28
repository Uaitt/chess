# frozen_string_literal: true

require_relative '../../../lib/pieces/knight/black_knight'

describe BlackKnight do
  subject(:black_knight) { described_class.new }
  describe '::starts_at?' do
    context 'when given 0 and 1' do
      it 'returns true' do
        expect(BlackKnight.starts_at?(0, 1)).to eq(true)
      end
    end

    context 'when given 0 and 6' do
      it 'returns true' do
        expect(BlackKnight.starts_at?(0, 6)).to eq(true)
      end
    end

    context 'when given 0 and 4' do
      it 'returns false' do
        expect(BlackKnight.starts_at?(0, 3)).to eq(false)
      end
    end

    context 'when given 2 and 1' do
      it 'returns true' do
        expect(BlackKnight.starts_at?(2, 2)).to eq(false)
      end
    end

    context 'when given 5 and 6' do
      it 'returns true' do
        expect(BlackKnight.starts_at?(5, 5)).to eq(false)
      end
    end

    context 'when given 2 and 3' do
      it 'returns false' do
        expect(BlackKnight.starts_at?(1, 2)).to eq(false)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_knight.color).to eq(:black)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      knight_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                      [2, 1], [2, -1], [-2, 1], [-2, -1]]
      expect(black_knight.basic_moves.sort).to eq(knight_moves.sort)
    end
  end
end
