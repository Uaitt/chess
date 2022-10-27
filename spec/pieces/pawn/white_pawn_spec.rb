# frozen_string_literal: true

require_relative '../../../lib/pieces/pawn/white_pawn'

describe WhitePawn do
  subject(:white_pawn) { described_class.new }
  describe '#initial_file' do
    context 'when the black pawn is the only one created' do
      it 'returns 0' do
        expect(white_pawn.initial_file).to eq(0)
      end
    end

    context 'when the black pawn is the second one being created' do
      it 'returns 1' do
        expect(white_pawn.initial_file).to eq(1)
      end
    end

    context 'when the black pawn is the fourth one created' do
      it 'returns 3' do
        described_class.new
        expect(white_pawn.initial_file).to eq(3)
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
