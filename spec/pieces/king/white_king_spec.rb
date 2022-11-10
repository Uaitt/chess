# frozen_string_literal: true

require_relative '../../../lib/pieces/king/white_king'

describe WhiteKing do
  subject(:white_king) { described_class.new }
  describe '::starts_at?' do
    context 'when given 7 and 4' do
      it 'returns true' do
        expect(WhiteKing).to be_starting_at(7, 4)
      end
    end

    context 'when given 7 and 3' do
      it 'returns false' do
        expect(WhiteKing).not_to be_starting_at(7, 3)
      end
    end

    context 'when given 2 and 4' do
      it 'returns false' do
        expect(WhiteKing).not_to be_starting_at(2, 4)
      end
    end

    context 'when given 3 and 3' do
      it 'returns false' do
        expect(WhiteKing).not_to be_starting_at(3, 3)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_king).to be_of_color(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      king_moves = [[1, 0], [-1, 0], [0, 1], [0, -1],
                    [1, 1], [-1, 1], [1, -1], [-1, -1]]
      expect(white_king.basic_moves.sort).to eq(king_moves.sort)
    end
  end
end
