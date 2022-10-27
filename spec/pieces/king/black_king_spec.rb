# frozen_string_literal: true

require_relative '../../../lib/pieces/king/black_king'

describe BlackKing do
  subject(:black_queen) { described_class.new }
  describe '#file' do
    it 'returns 3' do
      expect(black_queen.initial_file).to eq(3)
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(black_queen.color).to eq(:black)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      king_moves = [[1, 0], [-1, 0], [0, 1], [0, -1],
                    [1, 1], [-1, 1], [1, -1], [-1, -1]]
      expect(black_queen.basic_moves.sort).to eq(king_moves.sort)
    end
  end
end
