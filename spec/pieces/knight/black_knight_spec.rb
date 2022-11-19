# frozen_string_literal: true

require_relative '../../../lib/chess/pieces/knight/black_knight'

describe BlackKnight do
  subject(:black_knight) { described_class.new }
  describe '::starts_at?' do
    context 'when given 0 and 1' do
      it 'returns true' do
        expect(BlackKnight).to be_starting_at(0, 1)
      end
    end

    context 'when given 0 and 6' do
      it 'returns true' do
        expect(BlackKnight).to be_starting_at(0, 6)
      end
    end

    context 'when given 0 and 4' do
      it 'returns false' do
        expect(BlackKnight).not_to be_starting_at(0, 4)
      end
    end

    context 'when given 2 and 1' do
      it 'returns false' do
        expect(BlackKnight).not_to be_starting_at(2, 1)
      end
    end

    context 'when given 5 and 6' do
      it 'returns false' do
        expect(BlackKnight).not_to be_starting_at(5, 6)
      end
    end

    context 'when given 2 and 3' do
      it 'returns false' do
        expect(BlackKnight).not_to be_starting_at(2, 3)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_knight).to be_of_color(:black)
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
