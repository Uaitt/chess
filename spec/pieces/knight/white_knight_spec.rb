# frozen_string_literal: true

require_relative '../../../lib/pieces/knight/white_knight'

describe WhiteKnight do
  subject(:white_knight) { described_class.new }
  describe '::starts_at?' do
    context 'when given 7 and 1' do
      it 'returns true' do
        expect(WhiteKnight).to be_starting_at(7, 1)
      end
    end

    context 'when given 7 and 6' do
      it 'returns true' do
        expect(WhiteKnight).to be_starting_at(7, 6)
      end
    end

    context 'when given 7 and 4' do
      it 'returns false' do
        expect(WhiteKnight).not_to be_starting_at(7, 4)
      end
    end

    context 'when given 2 and 1' do
      it 'returns false' do
        expect(WhiteKnight).not_to be_starting_at(2, 1)
      end
    end

    context 'when given 5 and 6' do
      it 'returns false' do
        expect(WhiteKnight).not_to be_starting_at(5, 6)
      end
    end

    context 'when given 2 and 3' do
      it 'returns false' do
        expect(WhiteKnight).not_to be_starting_at(2, 3)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_knight).to be_of_color(:white)
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
