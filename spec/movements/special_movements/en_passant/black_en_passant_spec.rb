# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe BlackEnPassant do
  let(:black_en_passant) { described_class.new(board, black_pawn, end_position) }
  let(:black_pawn) { BlackPawn.new }
  let(:white_pawn) { WhitePawn.new }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when the black pawn is on fourth row' do
      let(:end_position) { [5, 1] }
      before do
        board.place_piece(black_pawn, [4, 0])
      end

      context 'when a pawn of the opposite color is placed in an adjacent square' do
        context 'when the last movement was that white pawn double leap' do
          before do
            board.place_piece(white_pawn, [6, 1])
            WhitePawnMovement.new(board, white_pawn, [4, 1]).apply
          end

          it 'returns true' do
            expect(black_en_passant).to be_valid
          end
        end

        context 'when the last movement was not that pawn double leap' do
          before do
            board.place_piece(white_pawn, [5, 1])
            WhitePawnMovement.new(board, white_pawn, [4, 1]).apply
          end

          it 'returns false' do
            expect(black_en_passant).not_to be_valid
          end
        end
      end

      context 'when a pawn is not placed in an adjacent square' do
        it 'returns false' do
          expect(black_en_passant).not_to be_valid
        end
      end
    end

    context 'when our pawn is not on fourth row' do
      let(:end_position) { [4, 1] }
      before do
        board.place_piece(black_pawn, [3, 0])
      end
      it 'returns false' do
        expect(black_en_passant).not_to be_valid
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [5, 1] }
    before do
      board.place_piece(black_pawn, [4, 0])
      board.place_piece(white_pawn, [4, 1])
      black_en_passant.apply
    end

    it 'removes the enemy pawn' do
      expect(board.piece_at([4, 1])).to be_instance_of(NilPiece)
    end

    it 'moves the black pawn to the right position' do
      expect(board.piece_at([5, 1])).to eq(black_pawn)
    end

    it 'removes the black pawn from the original position' do
      expect(board.piece_at([4, 0])).to be_instance_of(NilPiece)
    end
  end
end
