# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/pawn_movement'
require_relative '../../../lib/pieces/pawn'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe PawnMovement do
  subject { described_class.new(board, pawn, end_position) }
  let(:pawn) { Pawn.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the pawn is placed in the top left corner' do
      before do
        board.data[0][0] = pawn
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0] }
        it { is_expected.to be_possible }
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }

        context 'when it is not blocked by any piece' do
          it { is_expected.not_to be_possible }
        end

        context 'when it is blocked by a piece of the same color on arrival' do
          before do
            board.data[1][1] = Knight.new(:black)
          end

          it { is_expected.not_to be_possible }
        end

        context 'when it is blocked by a piece of the opposite color on arrival' do
          before do
            board.data[1][1] = Knight.new(:white)
          end

          it { is_expected.to be_possible }
        end
      end
    end
  end
end
