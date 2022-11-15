# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe Board do
  subject(:board) { described_class.new }

  describe '#set' do
    before do
      board.set
    end

    it 'places only black pieces on the first row' do
      expect(board.data[0]).to all(be_of_color(:black))
    end

    it 'places only black pieces on the second row' do
      expect(board.data[1]).to all(be_of_color(:black))
    end

    it 'places only white pieces on the seventh row' do
      expect(board.data[6]).to all(be_of_color(:white))
    end

    it 'places only white pieces on the eighth row' do
      expect(board.data[7]).to all(be_of_color(:white))
    end

    it 'places a black rook on the first square of the first row' do
      expect(board.data[0][0]).to be_instance_of(BlackRook)
    end

    it 'places a black knight on the second square of the first row' do
      expect(board.data[0][1]).to be_instance_of(BlackKnight)
    end

    it 'places a black bishop on the third square of the first row' do
      expect(board.data[0][2]).to be_instance_of(BlackBishop)
    end

    it 'places a black queen on the fourth square of the first row' do
      expect(board.data[0][3]).to be_instance_of(BlackQueen)
    end

    it 'places a black king on the fifth square of the first row' do
      expect(board.data[0][4]).to be_instance_of(BlackKing)
    end

    it 'places a black bishop on the sixth square of the first row' do
      expect(board.data[0][5]).to be_instance_of(BlackBishop)
    end

    it 'places a black knight on the seventh square of the first row' do
      expect(board.data[0][6]).to be_instance_of(BlackKnight)
    end

    it 'places a black rook on the eighth square of the first row' do
      expect(board.data[0][7]).to be_instance_of(BlackRook)
    end

    it 'places eight black pawns on the second row' do
      expect(board.data[1]).to all(be_instance_of(BlackPawn))
    end

    it 'places eight white pawns on the seventh row' do
      expect(board.data[6]).to all(be_instance_of(WhitePawn))
    end

    it 'places a white rook on the first square of the eighth row' do
      expect(board.data[7][0]).to be_instance_of(WhiteRook)
    end

    it 'places a white knight on the second square of the eighth row' do
      expect(board.data[7][1]).to be_instance_of(WhiteKnight)
    end

    it 'places a white bishop on the third square of the eighth row' do
      expect(board.data[7][2]).to be_instance_of(WhiteBishop)
    end

    it 'places a white queen on the fourth square of the eighth row' do
      expect(board.data[7][3]).to be_instance_of(WhiteQueen)
    end

    it 'places a white king on the fifth square of the eighth row' do
      expect(board.data[7][4]).to be_instance_of(WhiteKing)
    end

    it 'places a white bishop on the sixth square of the eighth row' do
      expect(board.data[7][5]).to be_instance_of(WhiteBishop)
    end

    it 'places a white knight on the seventh square of the eighth row' do
      expect(board.data[7][6]).to be_instance_of(WhiteKnight)
    end

    it 'places a white rook on the eighth square of the eighth row' do
      expect(board.data[7][7]).to be_instance_of(WhiteRook)
    end
  end

  describe '#current_position' do
    let(:black_piece) { BlackPiece.new }
    it 'returns the current position of the knight' do
      board.data[0][0] = black_piece
      expect(board.current_position(black_piece)).to eq([0, 0])
    end

    it 'returns the current position of the knight' do
      board.data[5][2] = black_piece
      expect(board.current_position(black_piece)).to eq([5, 2])
    end
  end

  describe '#piece_at' do
    it 'returns the piece at the right position' do
      black_piece = BlackPiece.new
      board.data[0][0] = black_piece
      expect(board.piece_at([0, 0])).to eq(black_piece)
    end

    it 'returns the piece at the right position' do
      white_piece = WhitePiece.new
      board.data[6][7] = white_piece
      expect(board.piece_at([6, 7])).to eq(white_piece)
    end
  end

  describe '#place_piece' do
    it 'places the piece at the given position' do
      black_piece = BlackPiece.new
      board.place_piece(black_piece, [3, 2])
      expect(board.data[3][2]).to eq(black_piece)
    end

    it 'places the piece at the given position' do
      white_piece = WhitePiece.new
      board.place_piece(white_piece, [6, 1])
      expect(board.data[6][1]).to eq(white_piece)
    end
  end

  describe '#at_least_a_valid_movement?' do
    let(:white_rook) { WhiteRook.new }
    let(:white_piece) { WhitePiece.new }
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
      board.place_piece(white_rook, [0, 0])
    end

    context 'when the piece has at least one valid movement' do
      it 'returns true' do
        expect(board.at_least_a_valid_movement?(white_rook)).to eq(true)
      end
    end

    context 'when the piece does not have one valid movement' do
      before do
        board.place_piece(white_piece, [1, 0])
        board.place_piece(white_piece, [0, 1])
      end

      it 'returns false' do
        expect(board.at_least_a_valid_movement?(white_rook)).to eq(false)
      end
    end
  end

  describe '#checked?' do
    let(:black_king) { BlackKing.new }
    let(:white_rook) { WhiteRook.new }
    let(:white_bishop) { WhiteBishop.new }
    let(:white_pawn) { WhitePawn.new }
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
      board.data[0][0] = black_king
    end

    context 'when the king is in check' do
      context 'when checked by a rook' do
        before do
          board.data[1][0] = white_rook
        end

        it 'returns true' do
          expect(board).to be_checked(black_king.color)
        end
      end

      context 'when checked by a bishop' do
        before do
          board.data[2][2] = white_bishop
        end

        it 'returns true' do
          expect(board).to be_checked(black_king.color)
        end
      end

      context 'when checked by a pawn' do
        before do
          board.data[1][1] = white_pawn
        end

        it 'returns true' do
          expect(board).to be_checked(black_king.color)
        end
      end
    end

    context 'when the king is not in check' do
      before do
        board.data[1][1] = white_rook
        board.data[1][0] = white_bishop
      end

      it 'returns false' do
        expect(board).not_to be_checked(black_king.color)
      end
    end
  end

  describe '#mated?' do
    let(:black_king) { BlackKing.new }
    let(:white_rook) { WhiteRook.new }
    let(:white_queen) { WhiteQueen.new }
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
      board.data[0][7] = black_king
    end

    context 'when the king is mated' do
      before do
        board.data[0][4] = white_rook
        board.data[2][7] = white_queen
      end

      it 'returns true' do
        expect(board).to be_mated(black_king.color)
      end
    end

    context 'when the king is not mated' do
      it 'returns false' do
        expect(board).not_to be_mated(black_king.color)
      end
    end
  end

  describe '#allowing_castling?' do
    let(:black_king) { BlackKing.new }
    let(:black_rook) { BlackRook.new }
    let(:white_rook) { WhiteRook.new }
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
    end

    context 'when it is black long castling' do
      let(:king_path) { [[0, 2], [0, 3]] }
      let(:separating_squares) { [[0, 1], [0, 2], [0, 3]] }
      before do
        board.data[0][4] = black_king
        board.data[0][0] = black_rook
      end

      context 'when the king is not in check' do
        context 'when the king crosses over no square attacked by an enemy piece' do
          context 'when all the separating squares are empty' do
            it 'returns true' do
              expect(board).to be_allowing_castling(:black, separating_squares, king_path)
            end
          end

          context 'when one separating square is not empty' do
            before do
              board.data[0][1] = black_king
            end

            it 'returns false' do
              expect(board).not_to be_allowing_castling(:black, separating_squares, king_path)
            end
          end
        end

        context 'when the king moves over a square attacked by an enemy piece' do
          before do
            board.data[1][2] = white_rook
          end

          it 'returns false' do
            expect(board).not_to be_allowing_castling(:black, separating_squares, king_path)
          end
        end
      end

      context 'when the king is in check' do
        before do
          board.data[0][5] = white_rook
        end

        it 'returns false' do
          expect(board).not_to be_allowing_castling(:black, separating_squares, king_path)
        end
      end
    end
  end
end
