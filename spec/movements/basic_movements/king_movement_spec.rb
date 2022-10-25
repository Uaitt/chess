# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/king_movement'
require_relative '../../../lib/pieces/king'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe KingMovement do
  subject { described_class.new(board, king, end_position) }
  let(:king) { King.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the king is placed in the top left corner' do
      before do
        board.data[0][0] = king
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is two step towards bottom and three towards right' do
        let(:end_position) { [2, 3] }
        it { is_expected.not_to be_possible }
      end
    end

    context 'when the king is placed in a random position' do
      before do
        board.data[3][4] = king
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [4, 4] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 4] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [3, 5] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards left' do
        let(:end_position) { [3, 3] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 5] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top right corner' do
        let(:end_position) { [2, 5] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top left corner' do
        let(:end_position) { [2, 3] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom left corner' do
        let(:end_position) { [4, 3] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom and three towards left' do
        let(:end_position) { [4, 1] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is one step towards top and two towards right' do
        let(:end_position) { [2, 6] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is one step towards bottom and three towards right' do
        let(:end_position) { [4, 7] }
        it { is_expected.not_to be_possible }
      end
    end
  end

  describe '#blocked?' do
    before do
      board.data[0][0] = king
    end

    context 'when the movement is blocked on arrival by a piece of the same color' do
      let(:end_position) { [1, 0] }
      before do
        board.data[1][0] = Knight.new(:black)
      end

      it { is_expected.to be_blocked }
    end

    context 'when the movement is blocked on arrival by a piece of the opposite color' do
      let(:end_position) { [1, 1] }
      before do
        board.data[1][1] = Knight.new(:white)
      end

      it { is_expected.not_to be_blocked }
    end

    context ' when the movement is not blocked by any piece' do
      let(:end_position) { [0, 1] }
      it { is_expected.not_to be_blocked }
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
