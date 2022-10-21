# frozen_string_literal: true

require_relative '../../lib/pieces/knight'
require_relative '../../lib/pieces/rook'
require_relative '../../lib/board'

describe Rook do
  subject(:rook) { described_class.new(:white) }
  describe '#able_to_reach?' do
    context 'when the position is reachable' do
      it 'returns true' do
        expect(rook.able_to_reach?([0, 0], [1, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([0, 0], [2, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([0, 0], [3, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([1, 1], [2, 1])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([1, 1], [7, 1])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([3, 3], [6, 3])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([2, 6], [2, 0])).to eq(true)
      end

      it 'returns true' do
        expect(rook.able_to_reach?([7, 7], [0, 7])).to eq(true)
      end
    end

    context 'when the position is not reachable' do
      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [1, 1])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [3, 3])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [8, 3])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([0, 0], [2, 2])).to eq(false)
      end

      it 'returns false' do
        expect(rook.able_to_reach?([3, 3], [5, 5])).to eq(false)
      end
    end
  end

  describe '#blocked?' do
    let(:board) { Board.new }
    let(:data) { board.instance_variable_get(:@data) }
    before do
      data[0][0] = rook
    end

    context 'when it is blocked by a piece of the same color in the path' do
      it 'returns true' do
        data[2][0] = Knight.new(:white)
        expect(rook.blocked?(board, [0, 0], [5, 0])).to eq(true)
      end
    end

    context 'when it is blocked by a piece of the opposite color in the path' do
      it 'returns true' do
        data[4][0] = Knight.new(:black)
        expect(rook.blocked?(board, [0, 0], [5, 0])).to eq(true)
      end
    end

    context 'when it is blocked by a piece of the same color in the last square' do
      it 'returns true' do
        data[5][0] = Knight.new(:white)
        expect(rook.blocked?(board, [0, 0], [5, 0])).to eq(true)
      end
    end

    context 'when it is blocked by a piece of the opposite color in the last square' do
      it 'returns false' do
        data[5][0] = Knight.new(:black)
        expect(rook.blocked?(board, [0, 0], [5, 0])).to eq(false)
      end
    end

    context 'when it is not blocked by any piece' do
      it 'returns false' do
        expect(rook.blocked?(board, [0, 0], [5, 0])).to eq(false)
      end
    end
  end

  describe '#base_move' do
    context 'when the movement is from up to down' do
      it 'returns [1, 0]' do
        expect(rook.base_move([0, 0], [5, 0])).to eq([1, 0])
      end

      it 'returns [1, 0]' do
        expect(rook.base_move([0, 7], [4, 7])).to eq([1, 0])
      end
    end

    context 'when the movement is from down to up' do
      it 'returns [-1, 0]' do
        expect(rook.base_move([5, 0], [0, 0])).to eq([-1, 0])
      end

      it 'returns [-1, 0]' do
        expect(rook.base_move([4, 7], [0, 7])).to eq([-1, 0])
      end
    end

    context 'when the movement is from left to right' do
      it 'returns [0, 1]' do
        expect(rook.base_move([0, 0], [0, 5])).to eq([0, 1])
      end

      it 'returns [0, 1]' do
        expect(rook.base_move([7, 0], [7, 7])).to eq([0, 1])
      end
    end

    context 'when the movement is from right to left' do
      it 'returns [0, -1]' do
        expect(rook.base_move([0, 5], [0, 0])).to eq([0, -1])
      end

      it 'returns [0, -1]' do
        expect(rook.base_move([7, 7], [7, 0])).to eq([0, -1])
      end
    end
  end
end
