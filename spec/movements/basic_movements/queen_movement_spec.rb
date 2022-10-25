# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/queen_movement'
require_relative '../../../lib/pieces/queen'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe QueenMovement do
  subject { described_class.new(board, queen, end_position) }
  let(:queen) { Queen.new(:black) }
  let(:board) { Board.new }

  describe '#possible?' do
    context 'when the queen is placed at the top right corner' do
      before do
        board.data[0][0] = queen
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0]}
        it { is_expected.to be_possible }
      end

      context 'when  the movement is one step towards the right' do
        let(:end_position) { [0, 1]}
        it { is_expected.to be_possible }
      end

      context 'when  the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1]}
        it { is_expected.to be_possible }
      end

      context 'when  the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2]}
        it { is_expected.not_to be_possible }
      end

      context 'when  the movement is one step towards bottom and three towards right' do
        let(:end_position) { [1, 3]}
        it { is_expected.not_to be_possible }
      end

      context 'when  the movement is three step towards bottom and one towards right' do
        let(:end_position) { [3, 1]}
        it { is_expected.not_to be_possible }
      end
    end

    context 'when the queen is placed in a random position' do
      before do
        board.data[3][4] = queen
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [4, 4]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 4]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [3, 5]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards left' do
        let(:end_position) { [3, 3]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top left corner' do
        let(:end_position) { [2, 3]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards top right corner' do
        let(:end_position) { [2, 5]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 5]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom left corner' do
        let(:end_position) { [4, 3]}
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [4, 6]}
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is one step towards top and two towards left' do
        let(:end_position) { [2, 2]}
        it { is_expected.not_to be_possible }
      end

      context 'when the movement is two steps towards top and three towards right' do
        let(:end_position) { [2, 7]}
        it { is_expected.not_to be_possible }
      end
    end
  end
end
