# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/knight_movement'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/pieces/rook'
require_relative '../../../lib/board'

describe KnightMovement do
  subject{ described_class.new(board, knight, end_position) }
  let(:knight) { Knight.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the knight is placed in the top left corner' do
      before do
        board.data[0][0] = knight
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2] }
        it { is_expected.to be_possible }
      end


      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [2, 1] }
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

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        it { is_expected.not_to be_possible }
      end
    end

    context 'when the knight is placed in a random position' do
      before do
        board.data[3][4] = knight
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [4, 6] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [5, 5] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards top and one towards left' do
        let(:end_position) { [1, 3] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top and two towards left' do
        let(:end_position) { [2, 2] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom and two towards left' do
        let(:end_position) { [4, 2] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards bottom and one towards left' do
        let(:end_position) { [5, 3] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards top and one towards right' do
        let(:end_position) { [1, 5] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top and two towards right' do
        let(:end_position) { [2, 6] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards bottom' do
        let(:end_position) { [5, 4] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is one step towards top and three towards left' do
        let(:end_position) { [2, 1] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is one step towards bottom and one towards left' do
        let(:end_position) { [4, 3] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is three steps towards bottom and one towards left' do
        let(:end_position) { [6, 3] }
        it { is_expected.not_to be_possible }
      end
    end
  end

  describe '#blocked?' do
    let(:end_position) { [5, 5] }
    before do
      board.data[3][4] = knight
    end

    context 'when the movement is blocked on transition by a piece of the same color' do
      before do
        board.data[5][4] = Knight.new(:white)
      end

      it { is_expected.not_to be_blocked }
    end

    context 'when the movement is blocked on transition by a piece of the opposite color' do
      before do
        board.data[4][5] = Knight.new(:black)
      end

      it { is_expected.not_to be_blocked }
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
      board.data[3][4] = knight
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
