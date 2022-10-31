# frozen_string_literal: true

require_relative '../../../../lib/movements/basic_movements/pawn/black_pawn_movement'
require_relative '../../../../lib/pieces/pawn/black_pawn'
require_relative '../../../../lib/pieces/white_piece'
require_relative '../../../../lib/board'

describe BlackPawnMovement do
  subject { described_class.new(board, black_pawn, end_position) }
  let(:black_pawn) { BlackPawn.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when it is placed in the top left corner' do
      before do
        board.data[0][0] = black_pawn
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[1][0] = piece
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
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }

        context 'when it is not blocked by any piece' do
          it { is_expected.not_to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[1][1] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards bottom' do
        let(:end_position) { [2, 0] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two step towards right' do
        let(:end_position) { [0, 2] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two step towards bottom right corner' do
        let(:end_position) { [2, 2] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when it is placed in the second row' do
      before do
        board.data[1][0] = black_pawn
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [2, 0] }
        context 'when the movement is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[2][0] = piece
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
      end

      context 'when the movement is two steps towards bottom' do
        let(:end_position) { [3, 0] }
        context 'when the movement is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when the movement is blocked on transition' do
          before do
            board.data[2][0] = piece
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
            board.data[3][0] = piece
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
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [1, 0] }
    before do
      board.data[0][0] = black_pawn
      subject.apply
    end
    it 'places the pawn on the right position' do
      expect(board.data[1][0]).to eq(black_pawn)
    end

    it 'removes the pawn from the initial position' do
      expect(board.data[0][0]).to eq(nil)
    end
  end

  describe '#allowing_en_passant?' do
    before do
      board.data[0][0] = black_pawn
    end

    context 'when the movement is a double leap' do
      let(:end_position) { [2, 0] }
      it 'returns true' do
        expect(subject).to be_allowing_en_passant
      end
    end

    context 'when the movement is not a double leap' do
      let(:end_position) { [1, 0] }
      it 'returns true' do
        expect(subject).not_to be_allowing_en_passant
      end
    end
  end
  # add tests for direction
end
