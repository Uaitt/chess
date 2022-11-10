# frozen_string_literal: true

require_relative '../../../../lib/movements/special_movements/en_passant/white_en_passant'
require_relative '../../../../lib/movements/basic_movements/pawn/black_pawn_movement'
require_relative '../../../../lib/pieces/pawn/white_pawn'
require_relative '../../../../lib/pieces/pawn/black_pawn'
require_relative '../../../../lib/pieces/nil_piece'
require_relative '../../../../lib/board'

describe WhiteEnPassant do
  let(:white_en_passant) { described_class.new(board, white_pawn, end_position) }
  let(:white_pawn) { WhitePawn.new }
  let(:board) { Board.new }
  let(:black_pawn) { BlackPawn.new }
  describe '#valid?' do
    context 'when the white pawn is on third row row' do
      let(:end_position) { [2, 1] }
      before do
        board.data[3][0] = white_pawn
      end

      context 'when a pawn of the opposite color is placed in an adjacent square' do
        context 'when the last movement was that black pawn double leap' do
          before do
            board.data[1][1] = black_pawn
            BlackPawnMovement.new(board, black_pawn, [3, 1]).apply
          end

          it 'returns true' do
            expect(white_en_passant).to be_valid
          end
        end

        context 'when the last movement was not that pawn double leap' do
          before do
            board.data[2][1] = black_pawn
            BlackPawnMovement.new(board, black_pawn, [3, 1]).apply
          end

          it 'returns false' do
            expect(white_en_passant).not_to be_valid
          end
        end
      end

      context 'when a pawn is not placed in an adjacent square' do
        it 'returns false' do
          expect(white_en_passant).not_to be_valid
        end
      end
    end

    context 'when our pawn is not on third row' do
      let(:end_position) { [4, 1] }
      before do
        board.data[4][0] = white_pawn
      end
      it 'returns false' do
        expect(white_en_passant).not_to be_valid
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [2, 1] }
    before do
      board.data[3][0] = white_pawn
      board.data[3][1] = black_pawn
      white_en_passant.apply
    end

    it 'removes the enemy pawn' do
      expect(board.data[3][1]).to be_instance_of(NilPiece)
    end

    it 'moves the white pawn to the right position' do
      expect(board.data[2][1]).to eq(white_pawn)
    end

    it 'removes the black pawn from the original position' do
      expect(board.data[3][0]).to be_instance_of(NilPiece)
    end
  end
end
