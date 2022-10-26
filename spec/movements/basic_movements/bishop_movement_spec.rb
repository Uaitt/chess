# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/bishop_movement'
require_relative '../../../lib/pieces/bishop'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe BishopMovement do
  subject { described_class.new(board, bishop, end_position) }
  let(:bishop) { Bishop.new(:black) }
  let(:knight) { Knight.new(color) }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when the bishop is placed in the top left corner' do
      before do
        board.data[0][0] = bishop
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[1][1] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
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
            board.data[2][2] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[4][4] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
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

      context 'when the movement is four steps towards bottom' do
        let(:end_position) { [4, 0] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is four step towards right' do
        let(:end_position) { [0, 4] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when the bishop is placed in a random position' do
      before do
        board.data[3][5] = bishop
      end
      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 6] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[4][6] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards bottom left corner' do
        let(:end_position) { [4, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[4][4] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards top left corner' do
        let(:end_position) { [1, 3] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][4] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[1][3] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards top right corner' do
        let(:end_position) { [1, 7] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][6] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[1][7] = knight
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color) { :white }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color) { :black }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards bottom' do
        let(:end_position) { [5, 5] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards top' do
        let(:end_position) { [1, 5] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards bottom and two towards left' do
        let(:end_position) { [4, 3] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two step towards top and one towards right' do
        let(:end_position) { [5, 6] }
        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#direction' do
    before do
      board.data[3][5] = bishop
    end

    context 'when the movement is towards bottom right corner' do
      let(:end_position) { [4, 6] }
      it 'returns [1, 1]' do
        expect(subject.direction).to eq([1, 1])
      end
    end

    context 'when the movement is towards top left corner' do
      let(:end_position) { [0, 2] }
      it 'returns [-1, -1]' do
        expect(subject.direction).to eq([-1, -1])
      end
    end

    context 'when the movement is towards bottom left corner' do
      let(:end_position) { [4, 4] }
      it 'returns [1, -1]' do
        expect(subject.direction).to eq([1, -1])
      end
    end

    context 'when the movement is towards top right corner' do
      let(:end_position) { [1, 7] }
      it 'returns [-1, 1]' do
        expect(subject.direction).to eq([-1, 1])
      end
    end
  end
end
