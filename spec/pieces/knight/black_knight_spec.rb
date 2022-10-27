# frozen_string_literal: true

require_relative '../../../lib/pieces/knight/black_knight'

describe BlackKnight do
  subject(:black_knight) { described_class.new }
  describe '#file' do
    context 'when the black knight is the only one created' do
      it 'returns 1' do
        expect(black_knight.initial_file).to eq(1)
      end
    end

    context 'when the black knight is not the only one created' do
      it 'returns 6' do
        expect(black_knight.initial_file).to eq(6)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_knight.color).to eq(:black)
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
