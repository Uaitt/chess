# frozen_string_literal: true

require_relative '../lib/basic_movement'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/bishop'
require_relative '../lib/board'

describe BasicMovement do
  subject(:basic_movement) { described_class.new(board, piece, end_position) }
  let(:board) { Board.new }
  describe '#possible?' do
    context 'when a rook is moving' do
      let(:piece) { Rook.new(:black) }
      before do
        board.data[0][0] = piece
      end

      context 'when the movement is possible' do
        let(:end_position) { [1, 0] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 0] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [0, 7] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end
      end

      context 'when the movement is not possible' do
        let(:end_position) { [1, 1] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [3, 3] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [1, 6] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end
      end
    end

    context 'when a knight is moving' do
      let(:piece) { Knight.new(:black) }
      before do
        board.data[1][1] = piece
      end

      context 'when the movement is possible' do
        let(:end_position) { [3, 2] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [2, 3] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [0, 3] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end
      end

      context 'when the movement is not possible' do
        let(:end_position) { [1, 2] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [3, 3] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [0, 2] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end
      end
    end

    context 'when a bishop is moving' do
      let(:piece) { Bishop.new(:black) }
      before do
        board.data[3][3] = piece
      end

      context 'when the movement is possible' do
        let(:end_position) { [0, 0] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [5, 5] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end

        let(:end_position) { [5, 1] }
        it 'returns true' do
          expect(basic_movement.possible?).to eq(true)
        end
      end

      context 'when the movement is not possible' do
        let(:end_position) { [3, 2] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [3, 7] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end

        let(:end_position) { [7, 3] }
        it 'returns false' do
          expect(basic_movement.possible?).to eq(false)
        end
      end
    end
  end

  describe '#blocked?' do
    context 'when a rook is moving' do
      let(:piece) { Rook.new(:black) }
      let(:end_position) { [5, 0] }
      before do
        board.data[0][0] = piece
      end

      context 'when it is blocked by a piece of the same color in the path' do
        it 'returns true' do
          board.data[2][0] = Knight.new(:white)
          expect(basic_movement.blocked?).to eq(true)
        end
      end

      context 'when it is blocked by a piece of the opposite color in the path' do
        it 'returns true' do
          board.data[2][0] = Knight.new(:black)
          expect(basic_movement.blocked?).to eq(true)
        end
      end

      context 'when it is blocked by a piece of the same color in the arriving square' do
        it 'returns true' do
          board.data[5][0] = Knight.new(:black)
          expect(basic_movement.blocked?).to eq(true)
        end
      end

      context 'when it is blocked by a piece of the opposite color in the arriving square' do
        it 'returns false' do
          board.data[5][0] = Knight.new(:white)
          expect(basic_movement.blocked?).to eq(false)
        end
      end

      context 'when it is not blocked by any piece' do
        it 'returns false' do
          expect(basic_movement.blocked?).to eq(false)
        end
      end
    end
  end
end
