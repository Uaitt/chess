# frozen_string_literal: true

require_relative '../lib/validator'
require_relative '../lib/board'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/rook'

describe Validator do
  subject(:validator) { described_class.new }

  describe '#valid_coordinate?' do
    context 'when given \'a8\'' do
      it 'returns true' do
        coordinate = 'a8'
        expect(validator.valid_coordinate?(coordinate)).to eq(true)
      end
    end

    context 'when given \'a1\'' do
      it 'returns true' do
        coordinate = 'a1'
        expect(validator.valid_coordinate?(coordinate)).to eq(true)
      end
    end

    context 'when given \'h7\'' do
      it 'returns true' do
        coordinate = 'h7'
        expect(validator.valid_coordinate?(coordinate)).to eq(true)
      end
    end

    context 'when given l4' do
      it 'returns false' do
        coordinate = 'l4'
        expect(validator.valid_coordinate?(coordinate)).to eq(false)
      end
    end

    context 'when given aa' do
      it 'returns false' do
        coordinate = 'aa'
        expect(validator.valid_coordinate?(coordinate)).to eq(false)
      end
    end

    context 'when given \'\'' do
      it 'returns false' do
        coordinate = ''
        expect(validator.valid_coordinate?(coordinate)).to eq(false)
      end
    end

    context 'when given \'1a\'' do
      it 'returns false' do
        coordinate = '1a'
        expect(validator.valid_coordinate?(coordinate)).to eq(false)
      end
    end

    context 'when given \'a2n\'' do
      it 'returns false' do
        coordinate = 'a2n'
        expect(validator.valid_coordinate?(coordinate)).to eq(false)
      end
    end

    context 'when given \'34\'' do
      it 'returns false' do
        coordinate = '34'
        expect(validator.valid_coordinate?(coordinate)).to eq(false)
      end
    end
  end

  describe '#valid_move?' do
    let(:board) { Board.new }
    let(:rook) { Rook.new(:black) }
    let(:knight) { Knight.new(:black) }
    let(:data) { board.instance_variable_get(:@data) }
    context 'when the piece is a rook' do
      context 'when position is not reachable' do
        xit 'returns false' do
          data[0][0] = rook
          expect(validator.valid_move?(board, knight, [1, 1])).to eq(false)
        end
      end

      context 'when position is reachable but path is blocked by a piece of the same color' do
        xit 'returns false' do
          data[0][0] = rook
          data[1][0] = knight
          expect(validator.valid_move?(board, knight, [2, 0])).to eq(false)
        end
      end

      context 'when position is reachable and path is not blocked' do
        xit 'returns true' do
          data[0][0] = rook
          expect(validator.valid_move?(board, knight, [2, 0])).to eq(false)
        end
      end
    end

    context 'when the piece is a knight' do
      context 'when it is able to reach the position' do
        it 'returns true' do
          data[0][0] = knight
          data[1][1] = rook
          expect(validator.valid_move?(board, knight, [1, 2])).to eq(true)
        end
      end
    end
  end
end
