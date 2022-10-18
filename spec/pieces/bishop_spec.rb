# frozen_string_literal: true

require_relative '../../lib/pieces/bishop'
require_relative '../../lib/pieces/knight'
require_relative '../../lib/board'

describe Bishop do
  subject(:bishop) { described_class.new(:white) }
  describe '#able_to_reach?' do
    context 'when the position is reachable' do
      it 'returns true' do
        expect(bishop.able_to_reach?([0, 0], [1, 1])).to eq(true)
      end

      it 'returns true' do
        expect(bishop.able_to_reach?([0, 0], [2, 2])).to eq(true)
      end

      it 'returns true' do
        expect(bishop.able_to_reach?([0, 0], [7, 7])).to eq(true)
      end

      it 'returns true' do
        expect(bishop.able_to_reach?([3, 2], [5, 4])).to eq(true)
      end

      it 'returns true' do
        expect(bishop.able_to_reach?([3, 2], [7, 6])).to eq(true)
      end

      it 'returns true' do
        expect(bishop.able_to_reach?([7, 7], [0, 0])).to eq(true)
      end

      it 'returns true' do
        expect(bishop.able_to_reach?([7, 0], [5, 2])).to eq(true)
      end
    end

    context 'when the position is not reachable' do
      it 'returns false' do
        expect(bishop.able_to_reach?([0, 0], [1, 0])).to eq(false)
      end

      it 'returns false' do
        expect(bishop.able_to_reach?([0, 0], [6, 0])).to eq(false)
      end

      it 'returns false' do
        expect(bishop.able_to_reach?([7, 7], [4, 3])).to eq(false)
      end

      it 'returns false' do
        expect(bishop.able_to_reach?([0, 7], [2, 4])).to eq(false)
      end

      it 'returns false' do
        expect(bishop.able_to_reach?([7, 0], [5, 3])).to eq(false)
      end
    end
  end

  describe '#blocked?' do
    let(:board) { Board.new }
    let(:data) { board.instance_variable_get(:@data) }
    before do
      data[0][0] = bishop
    end

    context 'when it is blocked by a piece of the same color in the path' do
      it 'returns true' do
        data[2][2] = Knight.new(:white)
        expect(bishop.blocked?(board, [0, 0], [5, 5])).to eq(true)
      end
    end

    context 'when it is blocked by a piece of the opposite color in the path' do
      it 'returns true' do
        data[4][4] = Knight.new(:black)
        expect(bishop.blocked?(board, [0, 0], [5, 5])).to eq(true)
      end
    end

    context 'when it is blocked by a piece of the same color in the last square' do
      it 'returns true' do
        data[5][5] = Knight.new(:white)
        expect(bishop.blocked?(board, [0, 0], [5, 5])).to eq(true)
      end
    end

    context 'when it is blocked by a piece of the opposite color in the last square' do
      it 'returns false' do
        data[5][5] = Knight.new(:black)
        expect(bishop.blocked?(board, [0, 0], [5, 5])).to eq(false)
      end
    end

    context 'when it is not blocked by any piece' do
      it 'returns false' do
        expect(bishop.blocked?(board, [0, 0], [5, 5])).to eq(false)
      end
    end
  end
end
