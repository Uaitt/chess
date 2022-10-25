# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/bishop_movement'
require_relative '../../../lib/pieces/bishop'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe BishopMovement do
  subject { described_class.new(board, bishop, end_position) }
  let(:bishop) { Bishop.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the bishop is placed in the top left corner' do
      before do
        board.data[0][0] = bishop
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards bottom right corner' do
        let(:end_position) { [2, 2] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is seven steps towards bottom right corner' do
        let(:end_position) { [7, 7] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2] }
        it { is_expected.not_to be_possible }
      end
    end

    context 'when the bishop is placed in a random position' do
      before do
        board.data[3][5] = bishop
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 6] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top right corner' do
        let(:end_position) { [2, 6] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards bottom left corner' do
        let(:end_position) { [5, 3] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards top left corner' do
        let(:end_position) { [1, 3] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [5, 6] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is two steps toward top and one towards right' do
        let(:end_position) { [1, 6] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is three steps toward bottom and two steps towards left' do
        let(:end_position) { [6, 4] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is three steps toward top and two steps towards left' do
        let(:end_position) { [0, 4] }
        it { is_expected.not_to be_possible }
      end
    end
  end

  describe '#blocked?' do
    let(:end_position) { [5, 5] }
    before do
      board.data[0][0] = bishop
    end

    context 'when the movement is blocked on transition by a piece of the same color' do
      before do
        board.data[2][2] = Knight.new(:white)
      end

      it { is_expected.to be_blocked }
    end

    context 'when the movement is blocked on transition by a piece of the opposite color' do
      before do
        board.data[3][3] = Knight.new(:black)
      end

      it { is_expected.to be_blocked }
    end

    context 'when the movement is blocked on arrival by a piece of the same color' do
      before do
        board.data[5][5] = Knight.new(:black)
      end

      it { is_expected.to be_blocked }
    end

    context 'when the movement is blocked on arrival by a piece of the opposite color' do
      before do
        board.data[5][5] = Knight.new(:white)
      end

      it { is_expected.not_to be_blocked }
    end

    context ' when the movement is not blocked by any piece' do
      it { is_expected.not_to be_blocked }
    end
  end

  describe '#direction' do
    before do
      board.data[3][5] = bishop
    end

    context 'when the movement is from top left to bottom right' do
      let(:end_position) { [4, 6] }
      it 'returns [1, 1]' do
        expect(subject.direction).to eq([1, 1])
      end
    end

    context 'when the movement is from bottom right to top left' do
      let(:end_position) { [0, 2] }
      it 'returns [-1, -1]' do
        expect(subject.direction).to eq([-1, -1])
      end
    end

    context 'when the movement is from top right to bottom left' do
      let(:end_position) { [4, 4] }
      it 'returns [1, -1]' do
        expect(subject.direction).to eq([1, -1])
      end
    end

    context 'when the movement is from bottom left to top right' do
      let(:end_position) { [1, 7] }
      it 'returns [-1, 1]' do
        expect(subject.direction).to eq([-1, 1])
      end
    end
  end
end
