# frozen_string_literal: true

require_relative '../../../lib/pieces/king/white_king'

describe WhiteKing do
  subject(:white_king) { described_class.new }
  describe '#file' do
    it 'returns 3' do
      expect(white_king.file).to eq(3)
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_king.color).to eq(:white)
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
