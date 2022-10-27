# frozen_string_literal: true

require_relative '../../../lib/pieces/rook/white_rook'

describe WhiteRook do
  subject(:white_rook) { described_class.new }

  describe '#file' do
    context 'when the black bishop is the only one created' do
      it 'returns 0' do
        expect(white_rook.initial_file).to eq(0)
      end
    end

    context 'when the black bishop is not the only one created' do
      it 'returns 7' do
        expect(white_rook.initial_file).to eq(7)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(white_rook.color).to eq(:white)
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
