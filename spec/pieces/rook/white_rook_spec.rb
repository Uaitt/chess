# frozen_string_literal: true

require_relative '../../../lib/chess/pieces/rook/white_rook'

describe WhiteRook do
  subject(:white_rook) { described_class.new }
  describe '::starts_at?' do
    context 'when given 7 and 0' do
      it 'returns true' do
        expect(WhiteRook).to be_starting_at(7, 0)
      end
    end

    context 'when given 7 and 7' do
      it 'returns true' do
        expect(WhiteRook).to be_starting_at(7, 7)
      end
    end

    context 'when given 7 and 4' do
      it 'returns false' do
        expect(WhiteRook).not_to be_starting_at(7, 4)
      end
    end

    context 'when given 2 and 0' do
      it 'returns true' do
        expect(WhiteRook).not_to be_starting_at(2, 0)
      end
    end

    context 'when given 5 and 0' do
      it 'returns true' do
        expect(WhiteRook).not_to be_starting_at(5, 0)
      end
    end

    context 'when given 2 and 1' do
      it 'returns false' do
        expect(WhiteRook).not_to be_starting_at(2, 1)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_rook).to be_of_color(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      rook_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
                    [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
                    [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7],
                    [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
      expect(white_rook.basic_moves.sort).to eq(rook_moves.sort)
    end
  end
end
