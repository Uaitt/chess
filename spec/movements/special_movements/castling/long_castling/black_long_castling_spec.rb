# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe BlackLongCastling do
  subject(:subject) { described_class.new(board, black_king, end_position) }
  let(:end_position)  { [0, 2] }
  let(:black_king) { BlackKing.new }
  let(:black_rook) { BlackRook.new }
  let(:board) { Board.new }
  describe '#valid?' do
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
    end

    context 'when the king was never moved' do
      before do
        board.place_piece(black_king, [0, 4])
      end

      context 'when the rook was never moved' do
        before do
          board.place_piece(black_rook, [0, 0])
        end

        context 'when the king is not currently in check' do
          context 'when the king crosses over no square attacked by an enemy piece' do
            context 'when all the separating squares are empty' do
              context 'when the movement does not put the king in check' do
                it { is_expected.to be_valid }
              end

              context 'when the movement does put the king in check' do
                before do
                  board.place_piece(WhiteRook.new, [1, 2])
                end

                it { is_expected.not_to be_valid }
              end
            end

            context 'when one separating square is not empty' do
              before do
                board.place_piece(BlackKnight.new, [0, 1])
              end

              it { is_expected.not_to be_valid }
            end
          end

          context 'when the king moves over a square attacked by an enemy piece' do
            before do
              board.place_piece(WhiteRook.new, [1, 3])
            end

            it { is_expected.not_to be_valid }
          end
        end

        context 'when the king is currently in check' do
          before do
            board.place_piece(WhiteRook.new, [0, 4])
          end

          it { is_expected.not_to be_valid }
        end
      end

      context 'when the rook has already moved' do
        before do
          board.place_piece(NilPiece.new, [0, 0])
        end

        it { is_expected.not_to be_valid }
      end
    end

    context 'when the king has already moved' do
      before do
        board.place_piece(black_king, [0, 0])
        black_king.movements = 4
      end

      it { is_expected.not_to be_valid }
    end
  end

  context 'when moving to a wrong square' do
    context 'when moving towards left' do
      let(:end_position) { [0, 1] }
      it { is_expected.not_to be_valid }
    end

    context 'when moving towards right' do
      let(:end_position) { [0, 5] }
      it { is_expected.not_to be_valid }
    end
  end

  describe '#apply' do
    before do
      board.place_piece(black_king, [0, 4])
      board.place_piece(black_rook, [0, 0])
      subject.apply
    end

    it 'places the black king on the right position' do
      expect(board.piece_at([0, 2])).to eq(black_king)
    end

    it 'removes the black king from the initial position' do
      expect(board.piece_at([0, 4])).to be_instance_of(NilPiece)
    end

    it 'set the number of movements of black king to one' do
      expect(black_king.movements).to eq(1)
    end

    it 'places the black rook on the right position' do
      expect(board.piece_at([0, 3])).to eq(black_rook)
    end

    it 'removes the black rook from the initial position' do
      expect(board.piece_at([0, 4])).to be_instance_of(NilPiece)
    end

    it 'set the number of movements of black rook to one' do
      expect(black_rook.movements).to eq(1)
    end
  end
end
