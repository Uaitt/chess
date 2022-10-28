# frozen_string_literal: true

require_relative '../../../../lib/movements/basic_movements/knight_movement/black_knight_movement'
require_relative '../../../../lib/pieces/knight/black_knight'
require_relative '../../../../lib/pieces/white_piece'
require_relative '../../../../lib/board'

describe BlackKnightMovement do
  subject { described_class.new(board, black_knight, end_position) }
  let(:black_knight) { BlackKnight.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when the knight is placed in the top left corner' do
      before do
        board.data[0][0] = black_knight
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[1][0] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
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

        context 'when the movement is two steps towards bottom and one towards right' do
          let(:end_position) { [2, 1] }
          context 'when it is not blocked' do
            it { is_expected.to be_valid }
          end

          context 'when it is blocked on transition' do
            before do
              board.data[0][1] = piece
            end

            context 'when the blocking piece is of the opposite color' do
              let(:color_class) { WhitePiece }
              it { is_expected.to be_valid }
            end

            context 'when the blocking piece is of the same color' do
              let(:color_class) { BlackPiece }
              it { is_expected.to be_valid }
            end
          end

          context 'when it is blocked on arrival' do
            before do
              board.data[2][1] = piece
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

        context 'when the movement is one step towards bottom' do
          let(:end_position) { [1, 0] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is one step towards right' do
          let(:end_position) { [0, 1] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is one step towards bottom right corner' do
          let(:end_position) { [1, 1] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is one step towards bottom and three towards right' do
          let(:end_position) { [1, 3] }
          it { is_expected.not_to be_valid }
        end
      end
    end

    context 'when the knight is placed in a random position' do
      before do
        board.data[3][4] = black_knight
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [4, 6] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[4][4] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[4][6] = piece
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

      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [5, 5] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][5] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[5][5] = piece
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

      context 'when the movement is one step towards top and two towards left' do
        let(:end_position) { [2, 2] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][4] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[2][2] = piece
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

      context 'when the movement is twp steps towards top and ond towards left' do
        let(:end_position) { [1, 3] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][3] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[1][3] = piece
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

      context 'when the movement is one step towards bottom and two towards left' do
        let(:end_position) { [4, 2] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][0] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[4][2] = piece
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

      context 'when the movement is two steps towards bottom and one towards left' do
        let(:end_position) { [5, 3] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][3] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[5][3] = piece
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

      context 'when the movement is one step towards top and two towards right' do
        let(:end_position) { [2, 6] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][4] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[2][6] = piece
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

      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [1, 5] }
        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][5] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[1][5] = piece
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
        let(:end_position) { [5, 4] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards top and three towards left' do
        let(:end_position) { [2, 1] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards bottom and one towards left' do
        let(:end_position) { [4, 3] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is three steps towards bottom and one towards left' do
        let(:end_position) { [6, 3] }
        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#direction' do
    before do
      board.data[3][4] = black_knight
    end

    context 'when the movement is one step towards top and two towards left' do
      let(:end_position) { [2, 2] }
      it 'returns [-1, -2]' do
        expect(subject.direction).to eq([-1, -2])
      end
    end

    context 'when the movement is two steps towards top and one towards left' do
      let(:end_position) { [1, 3] }
      it 'returns [-2, -1]' do
        expect(subject.direction).to eq([-2, -1])
      end
    end

    context 'when the movement is two steps towards top and one towards right' do
      let(:end_position) { [1, 5] }
      it 'returns [-2, 1]' do
        expect(subject.direction).to eq([-2, 1])
      end
    end

    context 'when the movement is one step towards top and two towards right' do
      let(:end_position) { [2, 6] }
      it 'returns [-1, 2]' do
        expect(subject.direction).to eq([-1, 2])
      end
    end

    context 'when the movement is one step towards bottom and two towards right' do
      let(:end_position) { [4, 6] }
      it 'returns [1, 2]' do
        expect(subject.direction).to eq([1, 2])
      end
    end

    context 'when the movement is two steps towards bottom and one towards right' do
      let(:end_position) { [5, 5] }
      it 'returns [2, 1]' do
        expect(subject.direction).to eq([2, 1])
      end
    end

    context 'when the the movement is one step towards bottom and two towards left' do
      let(:end_position) { [4, 2] }
      it 'returns [1, -2]' do
        expect(subject.direction).to eq([1, -2])
      end
    end

    context 'when the movement is two steps towards bottom and one towards left' do
      let(:end_position) { [5, 3] }
      it 'returns [2, -1]' do
        expect(subject.direction).to eq([2, -1])
      end
    end
  end
end
