# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/bishop_movement'
require_relative '../../../lib/pieces/bishop'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe BishopMovement do
  subject { described_class.new(board, bishop, end_position) }
  let(:bishop) { Bishop.new(:black) }
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
            board.data[1][1] = Knight.new(color)
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

        context 'when it is blocked' do
          before do
            board.data[4][4] = Knight.new(color)
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
