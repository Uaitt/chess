# frozen_string_literal: true

require_relative '../../../lib/pieces/bishop/white_bishop'

describe WhiteBishop do
  subject(:white_bishop) { described_class.new }

  describe '#file' do
    context 'when the white bishop is the only one created' do
      it 'returns 2' do
        expect(white_bishop.initial_file).to eq(2)
      end
    end

    context 'when the white bishop is not the only one created' do
      it 'returns 5' do
        expect(white_bishop.initial_file).to eq(5)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_bishop.color).to eq(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      bishop_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]] +
                     [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]] +
                     [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]] +
                     [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
      expect(white_bishop.basic_moves.sort).to eq(bishop_moves.sort)
    end
  end
end
