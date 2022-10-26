# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/pawn_movement'
require_relative '../../../lib/pieces/pawn'
require_relative '../../../lib/piece'
require_relative '../../../lib/board'

describe PawnMovement do
  subject { described_class.new(board, pawn, end_position) }
  let(:pawn) { Pawn.new(main_color) }
  let(:piece) { Piece.new(color) }
  let(:board) { Board.new }
  describe '#valid?' do
    context 'when the pawn is black' do
      let(:main_color) { :black }
      context 'when it is placed in the top left corner' do
        before do
          board.data[0][0] = pawn
        end

        context 'when the movement is one step towards bottom' do
          let(:end_position) { [1, 0] }
          context 'when it is not blocked by any piece' do
            it { is_expected.to be_valid }
          end

          context 'when it is blocked' do
            before do
              board.data[1][0] = piece
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
        end

        context 'when the movement is one step towards bottom right corner' do
          let(:end_position) { [1, 1] }

          context 'when it is not blocked by any piece' do
            it { is_expected.not_to be_valid }
          end

          context 'when it is blocked' do
            before do
              board.data[1][1] = piece
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

        context 'when the movement is one step towards right' do
          let(:end_position) { [0, 1] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is two step towards right' do
          let(:end_position) { [0, 2] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is two step towards bottom right corner' do
          let(:end_position) { [2, 2] }
          it { is_expected.not_to be_valid }
        end
      end

      context 'when it is placed in the second row' do
        before do
          board.data[1][0] = pawn
        end

        context 'when the movement is one step towards bottom' do
          let(:end_position) { [2, 0] }
          context 'when the movement is not blocked by any piece' do
            it { is_expected.to be_valid }
          end

          context 'when it is blocked' do
            before do
              board.data[2][0] = piece
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
        end

        context 'when the movement is two steps towards bottom' do
          let(:end_position) { [3, 0] }
          context 'when the movement is not blocked by any piece' do
            it { is_expected.to be_valid }
          end

          context 'when the movement is blocked on transition' do
            before do
              board.data[2][0] = piece
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

          context 'when the movement is blocked on arrival' do
            before do
              board.data[3][0] = piece
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
        end
      end
    end

    context 'when the pawn is white' do
      let(:main_color) { :white }
      context 'when it is placed in a random position' do
        before do
          board.data[3][4] = pawn
        end

        context 'when the movement is one step towards top' do
          let(:end_position) { [2, 4] }
          context 'when it is not blocked by any piece' do
            it { is_expected.to be_valid }
          end

          context 'when the movement is blocked' do
            before do
              board.data[2][4] = piece
            end
            context 'when the blocking piece is of the  color' do
              let(:color) { :black }
              it { is_expected.not_to be_valid }
            end

            context 'when the blocking piece is of the same color' do
              let(:color) { :white }
              it { is_expected.not_to be_valid }
            end
          end
        end

        context 'when the movement is one step towards top right corner' do
          let(:end_position) { [2, 5] }

          context 'when it is not blocked by any piece' do
            it { is_expected.not_to be_valid }
          end

          context 'when it is blocked' do
            before do
              board.data[2][5] = piece
            end

            context 'when the blocking piece is of the opposite color' do
              let(:color) { :black }
              it { is_expected.to be_valid }
            end

            context 'when it is blocked by a piece of the same color' do
              let(:color) { :white }
              it { is_expected.not_to be_valid }
            end
          end
        end

        context 'when the movement is two step towards top' do
          let(:end_position) { [1, 4] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is one step towards right' do
          let(:end_position) { [3, 5] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is two steps towards right' do
          let(:end_position) { [3, 6] }
          it { is_expected.not_to be_valid }
        end

        context 'when the movement is two steps towards top right corner' do
          let(:end_position) { [1, 6] }
          it { is_expected.not_to be_valid }
        end
      end

      context 'when it is placed in the seventh row' do
        before do
          board.data[6][0] = pawn
        end

        context 'when the movement is one steps towards top' do
          let(:end_position) { [5, 0] }
          context 'when the movement is not blocked by any piece' do
            it { is_expected.to be_valid }
          end

          context 'when it is blocked' do
            before do
              board.data[5][0] = piece
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
        end

        context 'when the movement is two steps towards top' do
          let(:end_position) { [4, 0] }
          context 'when the movement is not blocked by any piece' do
            it { is_expected.to be_valid }
          end

          context 'when the movement is blocked on transition' do
            before do
              board.data[5][0] = piece
            end

            context 'when the blocking piece is of the opposite color' do
              let(:color) { :black }
              it { is_expected.not_to be_valid }
            end

            context 'when the blocking piece is of the same color' do
              let(:color) { :white }
              it { is_expected.not_to be_valid }
            end
          end

          context 'when the movement is blocked on arrival' do
            before do
              board.data[4][0] = piece
            end

            context 'when the blocking piece is of the same color' do
              let(:color) { :white }
              it { is_expected.not_to be_valid }
            end

            context 'when the blocking piece is of the opposite color' do
              let(:color) { :black }
              it { is_expected.not_to be_valid }
            end
          end
        end
      end
    end
  end
end
