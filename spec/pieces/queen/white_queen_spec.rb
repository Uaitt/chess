# frozen_string_literal: true

require_relative '../../../lib/pieces/queen/white_queen'

describe WhiteQueen do
  subject(:white_queen) { described_class.new }
  describe '#initial_file' do
    it 'returns 4' do
      expect(white_queen.initial_file).to eq(4)
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_queen.color).to eq(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      queen_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
                     [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0],
                     [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
                     [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7],
                     [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
                     [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7],
                     [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
                     [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
      expect(white_queen.basic_moves.sort).to eq(queen_moves.sort)
    end
  end
end
