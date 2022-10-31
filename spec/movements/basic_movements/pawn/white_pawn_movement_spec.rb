# frozen_string_literal: true

require_relative '../../../../lib/movements/basic_movements/pawn/white_pawn_movement'
require_relative '../../../../lib/pieces/pawn/white_pawn'
require_relative '../../../../lib/pieces/black_piece'
require_relative '../../../../lib/board'

describe WhitePawnMovement do
  subject { described_class.new(board, white_pawn, end_position) }
  let(:white_pawn) { WhitePawn.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when it is placed in a random position' do
      before do
        board.data[3][4] = white_pawn
      end

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when the movement is blocked' do
          before do
            board.data[2][4] = piece
          end
          context 'when the blocking piece is of the  color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards top right corner' do
        let(:end_position) { [2, 5] }

        context 'when it is not blocked by any piece' do
          it { is_expected.not_to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[2][5] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when it is blocked by a piece of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two step towards top' do
        let(:end_position) { [1, 4] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [3, 5] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards right' do
        let(:end_position) { [3, 6] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards top right corner' do
        let(:end_position) { [1, 6] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when it is placed in the seventh row' do
      before do
        board.data[6][0] = white_pawn
      end

      context 'when the movement is one steps towards top' do
        let(:end_position) { [5, 0] }
        context 'when the movement is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[5][0] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards top' do
        let(:end_position) { [4, 0] }
        context 'when the movement is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when the movement is blocked on transition' do
          before do
            board.data[5][0] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when the movement is blocked on arrival' do
          before do
            board.data[4][0] = piece
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [1, 0] }
    before do
      board.data[0][0] = white_pawn
      subject.apply
    end
    it 'places the pawn on the right position' do
      expect(board.data[1][0]).to eq(white_pawn)
    end

    it 'removes the pawn from the initial position' do
      expect(board.data[0][0]).to eq(nil)
    end
  end

  describe '#allowing_en_passant?' do
    before do
      board.data[0][0] = white_pawn
    end

    context 'when the movement is a double leap' do
      let(:end_position) { [2, 0] }
      it 'returns true' do
        expect(subject).to be_allowing_en_passant
      end
    end

    context 'when the movement is not a double leap' do
      let(:end_position) { [1, 1] }
      it 'returns true' do
        expect(subject).not_to be_allowing_en_passant
      end
    end
  end
end
