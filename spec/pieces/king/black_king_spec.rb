# frozen_string_literal: true

require_relative '../../../lib/pieces/king/black_king'

describe BlackKing do
  subject(:black_king) { described_class.new }

  describe '::starts_at?' do
    context 'when given 0 and 4' do
      it 'returns true' do
        expect(BlackKing.starts_at?(0, 4)).to eq(true)
      end
    end

    context 'when given 0 and 3' do
      it 'returns false' do
        expect(BlackKing.starts_at?(0, 3)).to eq(true)
      end
    end

    context 'when given 2 and 4' do
      it 'returns false' do
        expect(BlackKing.starts_at?(2, 4)).to eq(true)
      end
    end

    context 'when given 3 and 3' do
      it 'returns false' do
        expect(BlackKing.starts_at?(3, 3)).to eq(true)
      end
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      king_moves = [[1, 0], [-1, 0], [0, 1], [0, -1],
                    [1, 1], [-1, 1], [1, -1], [-1, -1]]
      expect(black_king.basic_moves.sort).to eq(king_moves.sort)
    end
  end
end
