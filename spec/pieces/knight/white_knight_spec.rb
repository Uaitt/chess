# frozen_string_literal: true

require_relative '../../../lib/pieces/knight/white_knight'

describe WhiteKnight do
  subject(:white_knight) { described_class.new }
  describe '#file' do
    context 'when the white knight is the only one created' do
      it 'returns 1' do
        expect(white_knight.initial_file).to eq(1)
      end
    end

    context 'when the white knight is not the only one created' do
      it 'returns 6' do
        expect(white_knight.initial_file).to eq(6)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_knight.color).to eq(:white)
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
