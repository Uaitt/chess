# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/pieces/piece'
require_relative '../lib/pieces/nil_piece'
require_relative '../lib/pieces/bishop/black_bishop'
require_relative '../lib/pieces/bishop/white_bishop'
require_relative '../lib/pieces/king/black_king'
require_relative '../lib/pieces/king/white_king'
require_relative '../lib/pieces/knight/black_knight'
require_relative '../lib/pieces/knight/white_knight'
require_relative '../lib/pieces/pawn/black_pawn'
require_relative '../lib/pieces/pawn/white_pawn'
require_relative '../lib/pieces/queen/black_queen'
require_relative '../lib/pieces/queen/white_queen'
require_relative '../lib/pieces/rook/black_rook'
require_relative '../lib/pieces/rook/white_rook'
require_relative '../lib/movements/basic_movements/bishop/black_bishop_movement'
require_relative '../lib/movements/basic_movements/bishop/white_bishop_movement'
require_relative '../lib/movements/basic_movements/king/black_king_movement'
require_relative '../lib/movements/basic_movements/king/white_king_movement'
require_relative '../lib/movements/basic_movements/knight/black_knight_movement'
require_relative '../lib/movements/basic_movements/knight/white_knight_movement'
require_relative '../lib/movements/basic_movements/pawn/black_pawn_movement'
require_relative '../lib/movements/basic_movements/pawn/white_pawn_movement'
require_relative '../lib/movements/basic_movements/queen/black_queen_movement'
require_relative '../lib/movements/basic_movements/queen/white_queen_movement'
require_relative '../lib/movements/basic_movements/rook/black_rook_movement'
require_relative '../lib/movements/basic_movements/rook/white_rook_movement'
require_relative '../lib/movements/basic_movements/nil_movement'

describe Board do
  subject(:board) { described_class.new }

  describe '#set' do
    let(:data) { board.instance_variable_get(:@data) }
    before do
      board.set
    end

    it 'places only black pieces on the first row' do
      expect(data[0].all? { |piece| piece.color == :black }).to eq(true)
    end

    it 'places only black pieces on the second row' do
      expect(data[1].all? { |piece| piece.color == :black }).to eq(true)
    end

    it 'places only white pieces on the seventh row' do
      expect(data[6].all? { |piece| piece.color == :white }).to eq(true)
    end

    it 'places only white pieces on the eighth row' do
      expect(data[7].all? { |piece| piece.color == :white }).to eq(true)
    end

    it 'places a black rook on the first square of the first row' do
      expect(data[0][0].instance_of?(BlackRook)).to eq(true)
    end

    it 'places a black knight on the second square of the first row' do
      expect(data[0][1].instance_of?(BlackKnight)).to eq(true)
    end

    it 'places a black bishop on the third square of the first row' do
      expect(data[0][2].instance_of?(BlackBishop)).to eq(true)
    end

    it 'places a black queen on the fourth square of the first row' do
      expect(data[0][3].instance_of?(BlackQueen)).to eq(true)
    end

    it 'places a black king on the fifth square of the first row' do
      expect(data[0][4].instance_of?(BlackKing)).to eq(true)
    end

    it 'places a black bishop on the sixth square of the first row' do
      expect(data[0][5].instance_of?(BlackBishop)).to eq(true)
    end

    it 'places a black knight on the seventh square of the first row' do
      expect(data[0][6].instance_of?(BlackKnight)).to eq(true)
    end

    it 'places a black rook on the eighth square of the first row' do
      expect(data[0][7].instance_of?(BlackRook)).to eq(true)
    end

    it 'places eight black pawns on the second row' do
      expect(data[1].all? { |piece| piece.instance_of?(BlackPawn) }).to eq(true)
    end

    it 'places eight white pawns on the seventh row' do
      expect(data[6].all? { |piece| piece.instance_of?(WhitePawn) }).to eq(true)
    end

    it 'places a white rook on the first square of the eighth row' do
      expect(data[7][0].instance_of?(WhiteRook)).to eq(true)
    end

    it 'places a white knight on the second square of the eighth row' do
      expect(data[7][1].instance_of?(WhiteKnight)).to eq(true)
    end

    it 'places a white bishop on the third square of the eighth row' do
      expect(data[7][2].instance_of?(WhiteBishop)).to eq(true)
    end

    it 'places a white queen on the fourth square of the eighth row' do
      expect(data[7][3].instance_of?(WhiteQueen)).to eq(true)
    end

    it 'places a white king on the fifth square of the eighth row' do
      expect(data[7][4].instance_of?(WhiteKing)).to eq(true)
    end

    it 'places a white bishop on the sixth square of the eighth row' do
      expect(data[7][5].instance_of?(WhiteBishop)).to eq(true)
    end

    it 'places a white knight on the seventh square of the eighth row' do
      expect(data[7][6].instance_of?(WhiteKnight)).to eq(true)
    end

    it 'places a white rook on the eighth square of the eighth row' do
      expect(data[7][7].instance_of?(WhiteRook)).to eq(true)
    end
  end

  describe '#current_position' do
    let(:black_knight) { BlackKnight.new }
    let(:data) { board.instance_variable_get(:@data) }
    context 'when given a knight' do
      it 'returns the current position of the knight' do
        data[0][0] = black_knight
        expect(board.current_position(black_knight)).to eq([0, 0])
      end

      it 'returns the current position of the knight' do
        data[5][2] = black_knight
        expect(board.current_position(black_knight)).to eq([5, 2])
      end
    end
  end

  describe '#checked?' do
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
      board.data[0][0] = king
    end

    context 'when the king is black' do
      let(:king) { BlackKing.new }
      let(:rook) { WhiteRook.new }
      let(:bishop) { WhiteBishop.new }
      let(:pawn) { WhitePawn.new }

      context 'when the king is in check' do
        context 'when checked by a rook' do
          before do
            board.data[1][0] = rook
          end

          it 'returns true' do
            expect(board).to be_checked(king)
          end
        end

        context 'when checked by a bishop' do
          before do
            board.data[2][2] = bishop
          end

          it 'returns true' do
            expect(board).to be_checked(king)
          end
        end

        context 'when checked by a pawn' do
          before do
            board.data[1][1] = pawn
          end

          it 'returns true' do
            expect(board).to be_checked(king)
          end
        end
      end

      context 'when the king is not in check' do
        before do
          board.data[1][1] = rook
          board.data[1][0] = bishop
        end

        it 'returns false' do
          expect(board).not_to be_checked(king)
        end
      end
    end
  end
end
