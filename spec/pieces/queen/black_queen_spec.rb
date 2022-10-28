# frozen_string_literal: true

require_relative '../../../lib/pieces/queen/black_queen'

describe BlackQueen do
  subject(:black_queen) { described_class.new }
  describe '::starts_at?' do
    context 'when given 0 and 4' do
      it 'returns true' do
        expect(BlackQueen.starts_at?(0, 3)).to eq(true)
      end
    end

    context 'when given 0 and 1' do
      it 'returns false' do
        expect(BlackQueen.starts_at?(0, 1)).to eq(false)
      end
    end

    context 'when given 2 and 3' do
      it 'returns false' do
        expect(BlackQueen.starts_at?(2, 3)).to eq(false)
      end
    end

    context 'when given 6 and 5' do
      it 'returns false' do
        expect(BlackQueen.starts_at?(3, 3)).to eq(false)
      end
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      queen_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
                     [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
                     [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
                     [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7],
                     [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
                     [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7],
                     [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
                     [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
      expect(black_queen.basic_moves.sort).to eq(queen_moves.sort)
    end
  end
end
