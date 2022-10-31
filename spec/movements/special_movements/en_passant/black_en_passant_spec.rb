# frozen_string_literal: true

require_relative '../../../../lib/movements/special_movements/en_passant/black_en_passant'
require_relative '../../../../lib/pieces/pawn/black_pawn'
require_relative '../../../../lib/pieces/pawn/white_pawn'
require_relative '../../../../lib/board'

describe BlackEnPassant do
  let(:black_en_passant) { described_class.new(board, black_pawn, end_position) }
  let(:black_pawn) { BlackPawn.new }
  let(:white_pawn) { WhitePawn.new }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when our pawn is on fourth row' do
      let(:end_position) { [5, 1] }
      before do
        board.data[4][0] = black_pawn
      end

      context 'when a pawn is not placed in an adjacent square' do
        it 'returns false' do
          expect(black_en_passant).not_to be_valid
        end
      end
    end

    context 'when our pawn is not on fourth row' do
      before do
        board.data[3][0] = black_pawn
      end

      let(:end_position) { [4, 1] }
      it 'returns false' do
        expect(black_en_passant).not_to be_valid
      end
    end
  end
end
