# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe BasicMovement do
  let(:board) { Board.new }
  let(:end_position) { [] }
  describe '::for' do
    context 'when given a BlackRook' do
      let(:piece) { BlackRook.new }
      it 'returns a BlackRookMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(BlackRookMovement)
      end
    end

    context 'when given a BlackKnight' do
      let(:piece) { BlackKnight.new }
      it 'returns a BlackKnightMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(BlackKnightMovement)
      end
    end

    context 'when given a BlackBishop' do
      let(:piece) { BlackBishop.new }
      it 'returns a BlackBishopMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(BlackBishopMovement)
      end
    end

    context 'when given a BlackQueen' do
      let(:piece) { BlackQueen.new }
      it 'returns a BlackQueenMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(BlackQueenMovement)
      end
    end

    context 'when given a BlackKing' do
      let(:piece) { BlackKing.new }
      it 'returns a BlackKingMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(BlackKingMovement)
      end
    end

    context 'when given a BlackPawn' do
      let(:piece) { BlackPawn.new }
      it 'returns a BlackPawnMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(BlackPawnMovement)
      end
    end

    context 'when given a WhitePawn' do
      let(:piece) { WhitePawn.new }
      it 'returns a WhitePawnMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(WhitePawnMovement)
      end
    end

    context 'when given a WhiteRook' do
      let(:piece) { WhiteRook.new }
      it 'returns a WhiteRookMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(WhiteRookMovement)
      end
    end

    context 'when given a WhiteKnight' do
      let(:piece) { WhiteKnight.new }
      it 'returns a WhiteKnightMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(WhiteKnightMovement)
      end
    end

    context 'when given a WhiteBishop' do
      let(:piece) { WhiteBishop.new }
      it 'returns a WhiteBishopMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(WhiteBishopMovement)
      end
    end

    context 'when given a WhiteQueen' do
      let(:piece) { WhiteQueen.new }
      it 'returns a WhiteQueenMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(WhiteQueenMovement)
      end
    end

    context 'when given a WhiteKing' do
      let(:piece) { WhiteKing.new }
      it 'returns a WhiteKingMovement' do
        expect(BasicMovement.for(board, piece, end_position)).to be_instance_of(WhiteKingMovement)
      end
    end
  end
end
