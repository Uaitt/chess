# frozen_string_literal: true

require_relative '../../../lib/pieces/knight/white_knight'

describe WhiteKnight do
  subject(:white_knight) { described_class.new }
  describe '::starts_at?' do
    context 'when given 7 and 1' do
      it 'returns true' do
        expect(WhiteKnight.starts_at?(7, 1)).to eq(true)
      end
    end

    context 'when given 7 and 6' do
      it 'returns true' do
        expect(WhiteKnight.starts_at?(7, 6)).to eq(true)
      end
    end

    context 'when given 7 and 4' do
      it 'returns false' do
        expect(WhiteKnight.starts_at?(7, 3)).to eq(false)
      end
    end

    context 'when given 2 and 1' do
      it 'returns true' do
        expect(WhiteKnight.starts_at?(2, 2)).to eq(false)
      end
    end

    context 'when given 5 and 6' do
      it 'returns true' do
        expect(WhiteKnight.starts_at?(5, 5)).to eq(false)
      end
    end

    context 'when given 2 and 3' do
      it 'returns false' do
        expect(WhiteKnight.starts_at?(1, 2)).to eq(false)
      end
    end
  end
  describe '#color' do
    it 'returns white' do
      expect(white_knight.color).to eq(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      knight_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                      [2, 1], [2, -1], [-2, 1], [-2, -1]]
      expect(white_knight.basic_moves.sort).to eq(knight_moves.sort)
    end
  end
end
