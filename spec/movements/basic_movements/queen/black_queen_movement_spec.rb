# frozen_string_literal: true

require_relative '../../../../lib/movements/basic_movements/queen/black_queen_movement'
require_relative '../../../../lib/pieces/queen/black_queen'
require_relative '../../../../lib/pieces/pawn/black_pawn'
require_relative '../../../../lib/pieces/white_piece'
require_relative '../../../../lib/pieces/nil_piece'
require_relative '../../../../lib/board'

describe BlackQueenMovement do
  subject { described_class.new(board, black_queen, end_position) }
  let(:black_queen) { BlackQueen.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end
  describe '#valid?' do
    context 'when the queen is placed at the top right corner' do
      before do
        board.data[0][0] = black_queen
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
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[0][1] = piece
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

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
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

      context 'when the movement is four steps towards bottom right corner' do
        let(:end_position) { [4, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][2] = piece
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

        context 'when it is blocked on arrival' do
          before do
            board.data[4][4] = piece
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

      context ' when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2] }
        it { is_expected.not_to be_valid }
      end

      context ' when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [2, 1] }
        it { is_expected.not_to be_valid }
      end

      context ' when the movement is one step towards bottom and four towards right' do
        let(:end_position) { [1, 4] }
        it { is_expected.not_to be_valid }
      end

      context ' when the movement is four steps towards bottom and three towards right' do
        let(:end_position) { [4, 3] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when the queen is placed in a random position' do
      before do
        board.data[3][4] = black_queen
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [4, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[4][4] = piece
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

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[2][4] = piece
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

      context 'when the movement is two steps towards right' do
        let(:end_position) { [3, 6] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][5] = piece
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

        context 'when it is blocked on arrival' do
          before do
            board.data[3][6] = piece
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

      context 'when the movement is two steps towards left' do
        let(:end_position) { [3, 2] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][3] = piece
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

        context 'when it is blocked on arrival' do
          before do
            board.data[3][2] = piece
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

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 5] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[4][5] = piece
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

      context 'when the movement is one step towards bottom left corner' do
        let(:end_position) { [2, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[2][4] = piece
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

      context 'when the movement is two steps towards top left corner' do
        let(:end_position) { [1, 2] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][3] = piece
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

        context 'when it is blocked on arrival' do
          before do
            board.data[1][2] = piece
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

      context 'when the movement is two steps towards top right corner' do
        let(:end_position) { [1, 6] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][5] = piece
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

        context 'when it is blocked on arrival' do
          before do
            board.data[1][6] = piece
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

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [4, 6] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards top and two towards left' do
        let(:end_position) { [2, 2] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards top and three towards right' do
        let(:end_position) { [2, 7] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is three towards bottom and one towards left' do
        let(:end_position) { [6, 3] }
        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [3, 3] }
    before do
      board.data[0][0] = black_queen
      subject.apply
    end
    it 'places the bishop on the right position' do
      expect(board.data[3][3]).to eq(black_queen)
    end

    it 'removes the bishop from the initial position' do
      expect(board.data[0][0]).to eq(nil)
    end
  end

  describe '#allows_en_passant?' do
    let(:end_position) { [3, 3] }
    it 'returns false' do
      expect(subject.allows_en_passant?(BlackPawn.new)).to eq(false)
    end
  end

  describe '#direction' do
    before do
      board.data[3][4] = black_queen
    end

    context 'when the movement is towards bottom' do
      let(:end_position) { [7, 4] }
      it 'returns [1, 0]' do
        expect(subject.direction).to eq([1, 0])
      end
    end

    context 'when the movement is towards top' do
      let(:end_position) { [2, 4] }
      it 'returns [-1, 0]' do
        expect(subject.direction).to eq([-1, 0])
      end
    end

    context 'when the movement is towards right' do
      let(:end_position) { [3, 7] }
      it 'returns [0, 1]' do
        expect(subject.direction).to eq([0, 1])
      end
    end

    context 'when the movement is towards left' do
      let(:end_position) { [3, 1] }
      it 'returns [0, -1]' do
        expect(subject.direction).to eq([0, -1])
      end
    end

    context 'when the movement is towards top left corner' do
      let(:end_position) { [1, 2] }
      it 'returns [-1, -1]' do
        expect(subject.direction).to eq([-1, -1])
      end
    end

    context 'when the movement is towards top right corner' do
      let(:end_position) { [2, 5] }
      it 'returns [-1, 1]' do
        expect(subject.direction).to eq([-1, 1])
      end
    end

    context 'when the movement is towards bottom right corner' do
      let(:end_position) { [5, 6] }
      it 'returns [1, 1]' do
        expect(subject.direction).to eq([1, 1])
      end
    end

    context 'when the movement is towards bottom left corner' do
      let(:end_position) { [5, 3] }
      it 'returns [1, -1]' do
        expect(subject.direction).to eq([1, -1])
      end
    end
  end
end
