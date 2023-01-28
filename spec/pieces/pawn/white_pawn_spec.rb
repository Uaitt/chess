# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../lib/chess/pieces/pawn/white_pawn'

describe WhitePawn do
  subject(:white_pawn) { described_class.new }

  describe '::starts_at?' do
    context 'when given 6 and 0' do
      it 'returns true' do
        expect(described_class).to be_starting_at(6, 0)
      end
    end

    context 'when given 6 and 1' do
      it 'returns true' do
        expect(described_class).to be_starting_at(6, 1)
      end
    end

    context 'when given 6 and 7' do
      it 'returns true' do
        expect(described_class).to be_starting_at(6, 7)
      end
    end

    context 'when given 2 and 0' do
      it 'returns false' do
        expect(described_class).not_to be_starting_at(2, 0)
      end
    end

    context 'when given 3 and 3' do
      it 'returns false' do
        expect(described_class).not_to be_starting_at(3, 3)
      end
    end

    context 'when given 1 and 0' do
      it 'returns false' do
        expect(described_class).not_to be_starting_at(1, 0)
      end
    end
  end

  describe '#color' do
    it 'returns white' do
      expect(white_pawn).to be_of_color(:white)
    end
  end

  describe '#basic_moves' do
    it 'returns the right set of basic moves' do
      white_pawn_moves = [[-2, 0], [-1, 0], [-1, 1], [-1, -1]]
      expect(white_pawn.basic_moves.sort).to eq(white_pawn_moves.sort)
    end
  end
end
