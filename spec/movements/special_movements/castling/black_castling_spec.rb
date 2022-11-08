# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe BlackCastling do
  subject(:black_castling) { described_class.new(board, black_king, end_position) }
  let(:board) { Board.new }
  let(:black_king) { BlackKing.new }
  describe '#valid?' do
    context 'when moving to the left' do
      let(:end_position) { [0, 2] }
      context 'when the king has already moved' do
        before do
          board.data[0][0] = black_king
        end
        it 'returns false' do
          expect(black_castling).not_to be_valid
        end
      end
    end
  end
end
