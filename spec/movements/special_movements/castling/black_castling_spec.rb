# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe BlackCastling do
  subject(:subject) { described_class.new(board, black_king, end_position) }
  let(:board) { Board.new }
  let(:black_king) { BlackKing.new }
  let(:black_rook) { BlackRook.new }
  describe '#valid?' do
    before do
      board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
    end

    context 'when moving to the left' do
      let(:end_position) { [0, 2] }
      context 'when the king was never moved' do
        before do
          board.data[0][4] = black_king
        end

        context 'when the rook was never moved' do
          before do
            board.data[0][0] = black_rook
          end

          context 'when the king is not currently in check' do
            context 'when the king crosses over no square attacked by an enemy piece' do
              context 'when all the separating squares are empty' do
                context 'when the movement does not put the king in check' do
                  xit { is_expected.to be_valid }
                end

                context 'when the movement does put the king in check' do
                  before do
                    board.data[1][2] = WhiteRook.new
                  end

                  xit { is_expected.not_to be_valid }
                end
              end

              context 'when one separating square is not empty' do
                before do
                  board.data[0][1] = BlackKnight.new
                end

                it { is_expected.not_to be_valid }
              end
            end

            context 'when the king moves over a square attacked by an enemy piece' do
              before do
                board.data[1][3] = WhiteRook.new
              end

              it { is_expected.not_to be_valid }
            end
          end

          context 'when the king is currently in check' do
            before do
              board.data[0][4] = WhiteRook.new
            end

            it { is_expected.not_to be_valid }
          end
        end

        context 'when the rook has already moved' do
          before do
            board.data[0][0] = NilPiece.new
          end

          it { is_expected.not_to be_valid }
        end
      end

      context 'when the king has already moved' do
        before do
          board.data[0][0] = black_king
          black_king.movements = 4
        end

        it { is_expected.not_to be_valid }
      end
    end

    context 'when moving to the right' do
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
  end
end
