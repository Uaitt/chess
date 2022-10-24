# frozen_string_literal: true

require_relative '../../../lib/movements/basic_movements/bishop_movement'
require_relative '../../../lib/pieces/bishop'
require_relative '../../../lib/pieces/knight'
require_relative '../../../lib/board'

describe BiShopMovement do
  subject(:bishop_movement) { described_class.new(board, bishop, end_position) }
  let(:bishop) { Bishop.new(:black) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when the movement is possible' do
      context 'when the bishop is placed in the top left corner' do
        before do
          board.data[0][0] = bishop
        end

        let(:end_position) { [1, 1] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 2] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [4, 4] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [7, 7] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end
      end

      context 'when the bishop is placed in a random position' do
        before do
          board.data[3][5] = bishop
        end

        let(:end_position) { [4, 6] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 6] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [5, 3] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end

        let(:end_position) { [1, 3] }
        it 'returns true' do
          expect(bishop_movement.possible?).to eq(true)
        end
      end
    end

    context 'when the movement is not possible' do
      context 'when the bishop is placed in the top left corner' do
        before do
          board.data[0][0] = bishop
        end

        let(:end_position) { [1, 0] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [0, 1] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [1, 2] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [2, 1] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end
      end

      context 'when the bishop is placed in a random position' do
        before do
          board.data[3][5] = bishop
        end

        let(:end_position) { [5, 6] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [1, 6] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [6, 2] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end

        let(:end_position) { [0, 4] }
        it 'returns false' do
          expect(bishop_movement.possible?).to eq(false)
        end
      end
    end
  end

  describe '#blocked?' do
    let(:end_position) { [5, 5] }
    before do
      board.data[0][0] = bishop
    end
    context 'when the movement is blocked on transition by a piece of the same color' do
      it 'returns true' do
        board.data[2][2] = Knight.new(:white)
        expect(bishop_movement.blocked?).to eq(true)
      end
    end

    context 'when the movement is blocked on transition by a piece of the opposite color' do
      it 'returns true' do
        board.data[3][3] = Knight.new(:black)
        expect(bishop_movement.blocked?).to eq(true)
      end
    end

    context 'when the movement is blocked on arrival by a piece of the same color' do
      it 'returns true' do
        board.data[5][5] = Knight.new(:black)
        expect(bishop_movement.blocked?).to eq(true)
      end
    end

    context 'when the movement is blocked on arrival by a piece of the opposite color' do
      it 'returns false' do
        board.data[5][5] = Knight.new(:white)
        expect(bishop_movement.blocked?).to eq(false)
      end
    end

    context ' when the movement is not blocked by any piece' do
      it 'returns false' do
        expect(bishop_movement.blocked?).to eq(false)
      end
    end
  end

  describe '#direction' do
    before do
      board.data[3][5] = bishop
    end

    context 'when the movement is from top left to bottom right' do
      let(:end_position) { [4, 6] }
      it 'returns [1, 1]' do
        expect(bishop_movement.direction).to eq([1, 1])
      end
    end

    context 'when the movement is from bottom right to top left' do
      let(:end_position) { [0, 2] }
      it 'returns [-1, -1]' do
        expect(bishop_movement.direction).to eq([-1, -1])
      end
    end

    context 'when the movement is from top right to bottom left' do
      let(:end_position) { [4, 4] }
      it 'returns [1, -1]' do
        expect(bishop_movement.direction).to eq([1, -1])
      end
    end

    context 'when the movement is from bottom left to top right' do
      let(:end_position) { [1, 7] }
      it 'returns [-1, 1]' do
        expect(bishop_movement.direction).to eq([-1, 1])
      end
    end
  end

end
