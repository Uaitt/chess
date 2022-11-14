# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe Movement do
  let(:board) { Board.new }
  describe '::for' do
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
    end

    context 'when given a BlackRook' do
      let(:piece) { BlackRook.new }
      before do
        board.data[0][0] = piece
      end

      context 'when given a valid position' do
        let(:end_position) { [1, 0] }
        it 'returns a BlackRookMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(BlackRookMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 1] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a BlackKnight movement' do
      let(:piece) { BlackKnight.new }
      before do
        board.data[0][0] = piece
      end

      context 'when given a valid position' do
        let(:end_position) { [1, 2] }
        it 'returns a BlackKnightMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(BlackKnightMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 1] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a BlackBishop' do
      let(:piece) { BlackBishop.new }
      before do
        board.data[0][0] = piece
      end

      context 'when given a valid position' do
        let(:end_position) { [1, 1] }
        it 'returns a BlackBishopMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(BlackBishopMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 0] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a BlackQueen' do
      before do
        board.data[0][0] = piece
      end

      let(:piece) { BlackQueen.new }
      context 'when given a valid position' do
        let(:end_position) { [1, 1] }
        it 'returns a BlackQueenMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(BlackQueenMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 2] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a BlackKing' do
      before do
        board.data[0][0] = piece
      end

      let(:piece) { BlackKing.new }
      context 'when given a valid position' do
        let(:end_position) { [1, 1] }
        it 'returns a BlackKingMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(BlackKingMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 2] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a BlackPawn' do
      let(:piece) { BlackPawn.new }
      context 'when given a valid basic position' do
        let(:end_position) { [1, 0] }
        before do
          board.data[0][0] = piece
        end

        it 'returns a BlackPawnMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(BlackPawnMovement)
        end
      end

      context 'when given a valid special position' do
        let(:end_position) { [5, 1] }
        let(:white_pawn) { WhitePawn.new }
        before do
          board.data[4][0] = piece
          board.data[6][1] = white_pawn
          WhitePawnMovement.new(board, white_pawn, [4, 1]).apply
        end

        it 'returns a BlackEnPassant' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(BlackEnPassant)
        end
      end

      context 'when given an invalid position' do
        before do
          board.data[0][0] = piece
        end

        let(:end_position) { [1, 2] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a WhitePawn' do
      let(:piece) { WhitePawn.new }
      context 'when given a valid basic position' do
        let(:end_position) { [1, 1] }
        before do
          board.data[1][1] = BlackPiece.new
          board.data[2][2] = piece
        end

        it 'returns a WhitePawnMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(WhitePawnMovement)
        end
      end

      context 'when given a valid special position' do
        let(:end_position) { [2, 1] }
        let(:black_pawn) { BlackPawn.new }
        before do
          board.data[3][0] = piece
          board.data[1][1] = black_pawn
          WhitePawnMovement.new(board, black_pawn, [3, 1]).apply
        end

        it 'returns a WhiteEnPassant' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(WhiteEnPassant)
        end
      end

      context 'when given an invalid position' do
        before do
          board.data[2][2] = piece
        end

        let(:end_position) { [1, 0] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a WhiteRook' do
      let(:piece) { WhiteRook.new }
      before do
        board.data[0][0] = piece
      end

      context 'when given a valid position' do
        let(:end_position) { [2, 0] }
        it 'returns a WhiteRookMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(WhiteRookMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [2, 2] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a WhiteKnight movement' do
      let(:piece) { WhiteKnight.new }
      before do
        board.data[0][0] = piece
      end

      context 'when given a valid position' do
        let(:end_position) { [1, 2] }
        it 'returns a WhiteKnightMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(WhiteKnightMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 1] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a WhiteBishop' do
      let(:piece) { WhiteBishop.new }
      before do
        board.data[0][0] = piece
      end

      context 'when given a valid position' do
        let(:end_position) { [1, 1] }
        it 'returns a WhiteBishopMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(WhiteBishopMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 0] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a WhiteQueen' do
      before do
        board.data[0][0] = piece
      end

      let(:piece) { WhiteQueen.new }
      context 'when given a valid position' do
        let(:end_position) { [1, 1] }
        it 'returns a WhiteQueenMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(WhiteQueenMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 2] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a WhiteKing' do
      let(:piece) { WhiteKing.new }
      before do
        board.data[0][0] = piece
      end

      context 'when given a valid position' do
        let(:end_position) { [1, 1] }
        it 'returns a WhiteKingMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(WhiteKingMovement)
        end
      end

      context 'when given an invalid position' do
        let(:end_position) { [1, 2] }
        it 'returns a NilMovement' do
          expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
        end
      end
    end

    context 'when given a NilPiece' do
      let(:piece) { NilPiece }
      let(:end_position) { [2, 3] }
      it 'returns a NilMovement' do
        expect(Movement.for(board, piece, end_position)).to be_instance_of(NilMovement)
      end
    end
  end
end