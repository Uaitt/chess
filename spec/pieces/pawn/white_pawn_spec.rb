# frozen_string_literal: true

require_relative '../../../lib/pieces/pawn/white_pawn'

describe WhitePawn do
  subject(:white_pawn) { described_class.new }
  describe '::starts_at' do
    context 'when given 6 and a number between 0 and 7' do
      it 'returns true' do
        (1..7).all? { |number| WhitePawn.starts_at?(6, number) }
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_pawn.color).to eq(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      white_pawn_moves = [[-2, 0], [-1, 0], [-1, 1], [-1, -1]]
      expect(white_pawn.basic_moves.sort).to eq(white_pawn_moves.sort)
    end
  end
end
