# frozen_string_literal: true

require_relative '../../../lib/pieces/bishop/white_bishop'

describe WhiteBishop do
  subject(:white_bishop) { described_class.new }

  describe '#starts_at?' do
    context 'when given 7 and 2' do
      it 'returns true' do
        expect(WhiteBishop.starts_at?(7, 2).to eq(true)
      end
    end

    context 'when given 7 and 5' do
      it 'returns true' do
        expect(WhiteBishop.starts_at?(7, 5).to eq(true)
      end
    end

    context 'when given 2 and 2' do
      it 'returns true' do
        expect(WhiteBishop.starts_at?(2, 2).to eq(false)
      end
    end

    context 'when given 5 and 5' do
      it 'returns true' do
        expect(WhiteBishop.starts_at?(5, 5).to eq(false)
      end
    end

    context 'when given 7 and 3' do
      it 'returns false' do
        expect(WhiteBishop.starts_at?(7, 3).to eq(false)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_bishop.color).to eq(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      bishop_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]] +
                     [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]] +
                     [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]] +
                     [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
      expect(white_bishop.basic_moves.sort).to eq(bishop_moves.sort)
    end
  end
end
