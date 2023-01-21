# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/chess/pieces/king/black_king'

describe BlackKing do
  subject(:black_king) { described_class.new }
  describe '::starts_at?' do
    context 'when given 0 and 4' do
      it 'returns true' do
        expect(BlackKing).to be_starting_at(0, 4)
      end
    end

    context 'when given 0 and 3' do
      it 'returns false' do
        expect(BlackKing).not_to be_starting_at(0, 3)
      end
    end

    context 'when given 2 and 4' do
      it 'returns false' do
        expect(BlackKing).not_to be_starting_at(2, 4)
      end
    end

    context 'when given 3 and 3' do
      it 'returns false' do
        expect(BlackKing).not_to be_starting_at(3, 3)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_king).to be_of_color(:black)
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
