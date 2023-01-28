# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/chess/pieces/queen/black_queen'

describe BlackQueen do
  subject(:black_queen) { described_class.new }

  describe '::starts_at?' do
    context 'when given 0 and 3' do
      it 'returns true' do
        expect(described_class).to be_starting_at(0, 3)
      end
    end

    context 'when given 0 and 1' do
      it 'returns false' do
        expect(described_class).not_to be_starting_at(0, 1)
      end
    end

    context 'when given 2 and 3' do
      it 'returns false' do
        expect(described_class).not_to be_starting_at(2, 3)
      end
    end

    context 'when given 6 and 5' do
      it 'returns false' do
        expect(described_class).not_to be_starting_at(6, 5)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_queen).to be_of_color(:black)
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
