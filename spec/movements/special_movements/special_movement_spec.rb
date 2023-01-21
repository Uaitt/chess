# frozen_string_literal: true

require 'require_all'

require_all "#{__dir__}/../../../lib/"

describe SpecialMovement do
  let(:board) { Board.new }
  describe '::for' do
    context 'when given a BlackPawn' do
      let(:end_position) { [5, 1] }
      let(:piece) { BlackPawn.new }
      before do
        board.place_piece(piece, [4, 0])
      end

      it 'returns a BlackEnPassant' do
        expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(BlackEnPassant)
      end
    end

    context 'when given a BlackPawn' do
      let(:end_position) { [2, 1] }
      let(:piece) { WhitePawn.new }
      before do
        board.place_piece(piece, [3, 0])
      end

      it 'returns a BlackEnPassant' do
        expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(WhiteEnPassant)
      end
    end

    context 'when given a BlackKing' do
      let(:piece) { BlackKing.new }
      context 'when it is a long castling' do
        let(:end_position) { [0, 2] }
        it 'returns a BlackLongCastling' do
          expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(BlackLongCastling)
        end
      end

      context 'when given a short castling' do
        let(:end_position) { [0, 6] }
        it 'returns a BlackLongCastling' do
          expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(BlackShortCastling)
        end
      end
    end

    context 'when given a WhiteKing' do
      let(:piece) { WhiteKing.new }
      context 'when it is a long castling' do
        let(:end_position) { [7, 2] }
        it 'returns a WhiteLongCastling' do
          expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(WhiteLongCastling)
        end
      end

      context 'when given a short castling' do
        let(:end_position) { [7, 6] }
        it 'returns a WhiteLongCastling' do
          expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(WhiteShortCastling)
        end
      end
    end

    context 'when given a NilPiece' do
      let(:piece) { NilPiece.new }
      let(:end_position) { [0, 0] }
      it 'returns a NilMovement' do
        expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(NilMovement)
      end
    end
  end
end
