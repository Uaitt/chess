# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe SpecialMovement do
  let(:board) { Board.new }
  let(:end_position) { [0, 0] }
  describe '::for' do
    context 'when given a BlackPawn' do
      let(:piece) { BlackPawn.new }
      before do
        board.data[4][0] = piece
      end

      it 'returns a BlackEnPassant' do
        expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(BlackEnPassant)
      end
    end

    context 'when given a BlackPawn' do
      let(:piece) { WhitePawn.new }
      before do
        board.data[3][0] = piece
      end

      it 'returns a BlackEnPassant' do
        expect(SpecialMovement.for(board, piece, end_position)).to be_instance_of(WhiteEnPassant)
      end
    end

    context 'when'
  end
end
