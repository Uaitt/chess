# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe BlackCastling do
  subject(:subject) { described_class.new(board, black_king, end_position) }
  let(:board) { Board.new }
  let(:black_king) { BlackKing.new }
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

        context 'when the rook has already moved' do
          before do
            board.data[0][0] = NilPiece.new
          end

          it { is_expected.not_to be_valid }
        end

        context 'when the rook was never moved' do
          before do
            board.data[0][0] = BlackRook.new
          end

          context 'when the king is not in check' do
            ###
          end

          context 'when the king is currently in check' do
            before do
              board.data[0][5] = WhiteRook.new
            end

            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the king has already moved' do
        before do
          board.data[0][0] = black_king
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
