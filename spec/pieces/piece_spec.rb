# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe Piece do
  describe '::for' do
    context 'when given 0 and 0' do
      it 'returns a BlackRook' do
        expect(Piece.for(0, 0)).to be_instance_of(BlackRook)
      end
    end

    context 'when given 0 and 1' do
      it 'returns a BlackKnight' do
        expect(Piece.for(0, 1)).to be_instance_of(BlackKnight)
      end
    end

    context 'when given 0 and 2' do
      it 'returns a BlackBishop' do
        expect(Piece.for(0, 2)).to be_instance_of(BlackBishop)
      end
    end

    context 'when given 0 and 3' do
      it 'returns a BlackQueen' do
        expect(Piece.for(0, 3)).to be_instance_of(BlackQueen)
      end
    end

    context 'when given 0 and 4' do
      it 'returns a BlackKing' do
        expect(Piece.for(0, 4)).to be_instance_of(BlackKing)
      end
    end

    context 'when given 0 and 5' do
      it 'returns a BlackBishop' do
        expect(Piece.for(0, 5)).to be_instance_of(BlackBishop)
      end
    end

    context 'when given 0 and 6' do
      it 'returns a BlackKnight' do
        expect(Piece.for(0, 6)).to be_instance_of(BlackKnight)
      end
    end

    context 'when given 0 and 7' do
      it 'returns a BlackRook' do
        expect(Piece.for(0, 7)).to be_instance_of(BlackRook)
      end
    end

    context 'when given 1 and 0' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 0)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 1 and 1' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 1)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 1 and 2' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 2)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 1 and 3' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 3)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 1 and 4' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 4)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 1 and 5' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 5)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 1 and 6' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 6)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 1 and 7' do
      it 'returns a BlackPawn' do
        expect(Piece.for(1, 0)).to be_instance_of(BlackPawn)
      end
    end

    context 'when given 6 and 0' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 0)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 6 and 1' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 1)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 6 and 2' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 2)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 6 and 3' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 3)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 6 and 4' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 4)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 6 and 5' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 5)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 6 and 6' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 6)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 6 and 7' do
      it 'returns a WhitePawn' do
        expect(Piece.for(6, 7)).to be_instance_of(WhitePawn)
      end
    end

    context 'when given 7 and 0' do
      it 'returns a WhiteRook' do
        expect(Piece.for(7, 0)).to be_instance_of(WhiteRook)
      end
    end

    context 'when given 7 and 1' do
      it 'returns a WhiteKnight' do
        expect(Piece.for(7, 1)).to be_instance_of(WhiteKnight)
      end
    end

    context 'when given 7 and 2' do
      it 'returns a WhiteBishop' do
        expect(Piece.for(7, 2)).to be_instance_of(WhiteBishop)
      end
    end

    context 'when given 7 and 3' do
      it 'returns a WhiteQueen' do
        expect(Piece.for(7, 3)).to be_instance_of(WhiteQueen)
      end
    end

    context 'when given 7 and 4' do
      it 'returns a WhiteKing' do
        expect(Piece.for(7, 4)).to be_instance_of(WhiteKing)
      end
    end

    context 'when given 7 and 5' do
      it 'returns a WhiteBishop' do
        expect(Piece.for(7, 5)).to be_instance_of(WhiteBishop)
      end
    end

    context 'when given 7 and 6' do
      it 'returns a WhiteKnight' do
        expect(Piece.for(7, 6)).to be_instance_of(WhiteKnight)
      end
    end

    context 'when given 7 and 7' do
      it 'returns a WhiteRook' do
        expect(Piece.for(7, 7)).to be_instance_of(WhiteRook)
      end
    end
  end
end
