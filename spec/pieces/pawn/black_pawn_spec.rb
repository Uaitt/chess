# frozen_string_literal: true

require_relative '../../../lib/pieces/pawn/black_pawn'

describe BlackPawn do
  subject(:black_pawn) { described_class.new }
  describe '::starts_at?' do
    context 'when given 1 and a number between 0 and 7' do
      it 'returns true' do
        (1..7).all? { |number| BlackPawn.starts_at?(0, number) }
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_pawn.color).to eq(:black)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      white_pawn_moves = [[2, 0], [1, 0], [1, 1], [1, -1]]
      expect(black_pawn.basic_moves.sort).to eq(white_pawn_moves.sort)
    end
  end
end
