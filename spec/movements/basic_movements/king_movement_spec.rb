# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/king_movement'
require_relative '../../../lib/pieces/king'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe KingMovement do
  subject { described_class.new(board, king, end_position) }
  let(:king) { King.new(:black) }
  let(:knight) { Knight.new(color) }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when the king is placed in the top left corner' do
      before do
        board.data[0][0] = king
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[1][0] = knight
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

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[0][1] = knight
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

      context 'when the movement is two steps towards bottom' do
        let(:end_position) { [2, 0] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is three steps towards right' do
        let(:end_position) { [0, 3] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards bottom right corner' do
        let(:end_position) { [2, 2] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards bottom and three towards right' do
        let(:end_position) { [1, 3] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when the king is placed in a random position' do
      before do
        board.data[3][4] = king
      end
  end

  describe '#direction' do
    before do
      board.data[3][4] = king
    end

    context 'when the movement is one step towards bottom' do
      let(:end_position) { [4, 4] }
      it 'returns [1, 0]' do
        expect(subject.direction).to eq([1, 0])
      end
    end

    context 'when the movement is one step towards top' do
      let(:end_position) { [2, 4] }
      it 'returns [-1, 0]' do
        expect(subject.direction).to eq([-1, 0])
      end
    end

    context 'when the movement is one step towards right' do
      let(:end_position) { [3, 5] }
      it 'returns [0, 1]' do
        expect(subject.direction).to eq([0, 1])
      end
    end

    context 'when the movement is one step towards left' do
      let(:end_position) { [3, 3] }
      it 'returns [0, -1]' do
        expect(subject.direction).to eq([0, -1])
      end
    end

    context 'when the movement is one step towards top right corner' do
      let(:end_position) { [2, 5] }
      it 'returns [-1, 1]' do
        expect(subject.direction).to eq([-1, 1])
      end
    end

    context 'when the movement is one step towards bottom right corner' do
      let(:end_position) { [4, 5] }
      it 'returns [1, 1]' do
        expect(subject.direction).to eq([1, 1])
      end
    end

    context 'when the movement is one step towards top left corner' do
      let(:end_position) { [2, 3] }
      it 'returns [-1, -1]' do
        expect(subject.direction).to eq([-1, -1])
      end
    end

    context 'when the movement is one step towards bottom left corner' do
      let(:end_position) { [4, 3] }
      it 'returns [1, -1]' do
        expect(subject.direction).to eq([1, -1])
      end
    end
  end
end
