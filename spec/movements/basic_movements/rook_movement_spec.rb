# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/rook_movement'
require_relative '../../../lib/pieces/rook'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe RookMovement do
  subject { described_class.new(board, piece, end_position) }
  let(:piece) { Rook.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the rook is placed on the top-left corner' do
      before do
        board.data[0][0] = piece
      end

      context 'when the movement is one step towards bottom ' do
        let(:end_position) { [1, 0] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is three steps towards bottom ' do
        let(:end_position) { [3, 0] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step to the right' do
        let(:end_position) { [0, 1] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps to the right' do
        let(:end_position) { [0, 2] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom and one towards right' do
        let(:end_position) { [1, 1] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is three steps towards bottom and one towards right' do
        let(:end_position) { [3, 1] }
        it { is_expected.not_to be_possible }
      end
    end

    context 'when the rook is placed in a random position' do
      before do
        board.data[3][5] = piece
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [3, 6] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is five steps towards left' do
        let(:end_position) { [3, 0] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is three steps towards top' do
        let(:end_position) { [0, 5] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards bottom' do
        let(:end_position) { [5, 5] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is two steps towards top and one towards right' do
        let(:end_position) { [1, 6] }
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is four steps towards bottom and two towards left' do
        let(:end_position) { [7, 4] }
        it { is_expected.not_to be_possible }
      end
    end
  end

  describe '#blocked?' do
    let(:end_position) { [5, 0] }
    before do
      board.data[0][0] = piece
    end
    context 'when the movement is blocked on transition by a piece of the same color' do
      before do
        board.data[2][0] = Knight.new(:white)
      end

      it { is_expected.to be_blocked }
    end

    context 'when the movement is blocked on transition by a piece of the opposite color' do
      before do
        board.data[3][0] = Knight.new(:black)
      end

      it { is_expected.to be_blocked }
    end

    context 'when the movement is blocked on arrival by a piece of the same color' do
      before do
        board.data[5][0] = Knight.new(:black)
      end

      it { is_expected.to be_blocked }
    end

    context 'when the movement is blocked on arrival by a piece of the opposite color' do
      before do
        board.data[5][0] = Knight.new(:white)
      end

      it { is_expected.not_to be_blocked }
    end

    context ' when the movement is not blocked by any piece' do
      it { is_expected.not_to be_blocked }
    end
  end

  describe '#direction' do
    before do
      board.data[3][3] = piece
    end

    context 'when the movement is from top to bottom' do
      let(:end_position) { [6, 3] }
      it 'returns [1, 0]' do
        expect(subject.direction).to eq([1, 0])
      end
    end

    context 'when the movement is from bottom to top' do
      let(:end_position) { [0, 3] }
      it 'returns [-1, 0]' do
        expect(subject.direction).to eq([-1, 0])
      end
    end

    context 'when the movement is from left to right' do
      let(:end_position) { [3, 6] }
      it 'returns [0, 1]' do
        expect(subject.direction).to eq([0, 1])
      end
    end

    context 'when the movement is from right to left' do
      let(:end_position) { [3, 0] }
      it 'returns [0, -1]' do
        expect(subject.direction).to eq([0, -1])
      end
    end
  end
end
