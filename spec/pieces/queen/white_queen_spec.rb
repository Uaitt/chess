# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/chess/pieces/queen/white_queen'

describe WhiteQueen do
  subject(:white_queen) { described_class.new }
  describe '::starts_at?' do
    context 'when given 7 and 3' do
      it 'returns true' do
        expect(WhiteQueen).to be_starting_at(7, 3)
      end
    end

    context 'when given 7 and 1' do
      it 'returns false' do
        expect(WhiteQueen).not_to be_starting_at(7, 1)
      end
    end

    context 'when given 2 and 3' do
      it 'returns false' do
        expect(WhiteQueen).not_to be_starting_at(2, 3)
      end
    end

    context 'when given 6 and 5' do
      it 'returns false' do
        expect(WhiteQueen).not_to be_starting_at(6, 5)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_queen).to be_of_color(:white)
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
      expect(white_queen.basic_moves.sort).to eq(queen_moves.sort)
    end
  end
end
