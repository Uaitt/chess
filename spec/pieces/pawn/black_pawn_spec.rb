# frozen_string_literal: true

require_relative '../../../lib/pieces/pawn/black_pawn'

describe BlackPawn do
  subject(:black_pawn) { described_class.new }
  describe '::starts_at?' do
    context 'when given 1 and 0' do
      it 'returns true' do
        expect(BlackPawn).to be_starting_at(1, 0)
      end
    end

    context 'when given 1 and 1' do
      it 'returns true' do
        expect(BlackPawn).to be_starting_at(1, 1)
      end
    end

    context 'when given 1 and 7' do
      it 'returns true' do
        expect(BlackPawn).to be_starting_at(1, 7)
      end
    end

    context 'when given 2 and 0' do
      it 'returns false' do
        expect(BlackPawn).not_to be_starting_at(2, 0)
      end
    end

    context 'when given 3 and 3' do
      it 'returns false' do
        expect(BlackPawn).not_to be_starting_at(3, 3)
      end
    end

    context 'when given 6 and 0' do
      it 'returns false' do
        expect(BlackPawn).not_to be_starting_at(6, 0)
      end
    end
  end

  describe '#color' do
    it 'returns black' do
      expect(black_pawn).to be_of_color(:black)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      white_pawn_moves = [[2, 0], [1, 0], [1, 1], [1, -1]]
      expect(black_pawn.basic_moves.sort).to eq(white_pawn_moves.sort)
    end
  end
end
