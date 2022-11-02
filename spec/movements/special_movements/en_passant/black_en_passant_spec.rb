# frozen_string_literal: true

require_relative '../../../../lib/movements/special_movements/en_passant/black_en_passant'
require_relative '../../../../lib/movements/basic_movements/pawn/white_pawn_movement'
require_relative '../../../../lib/pieces/pawn/black_pawn'
require_relative '../../../../lib/pieces/pawn/white_pawn'
require_relative '../../../../lib/board'

describe BlackEnPassant do
  let(:black_en_passant) { described_class.new(board, black_pawn, end_position, last_movement) }
  let(:black_pawn) { BlackPawn.new }
  let(:board) { Board.new }
  let(:last_board) { Board.new }
  let(:white_pawn) { WhitePawn.new }
  describe '#valid?' do
    context 'when the black pawn is on fourth row' do
      let(:end_position) { [5, 1] }
      before do
        board.data[4][0] = black_pawn
      end

      context 'when a pawn of the opposite color is placed in an adjacent square' do
        before do
          board.data[4][1] = white_pawn
        end

        context 'when the last movement was that white pawn double leap' do
          let(:last_movement) { WhitePawnMovement.new(last_board, white_pawn, [4, 1]) }
          before do
            last_board.data[6][1] = white_pawn
          end

          it 'returns true' do
            expect(black_en_passant).to be_valid
          end
        end

        context 'when the last movement was not that pawn double leap' do
          let(:last_movement) { WhitePawnMovement.new(last_board, white_pawn, [4, 1]) }
          before do
            last_board.data[5][1] = white_pawn
          end

          it 'returns false' do
            expect(black_en_passant).not_to be_valid
          end
        end
      end

      context 'when a pawn is not placed in an adjacent square' do
        let(:last_movement) { nil }
        it 'returns false' do
          expect(black_en_passant).not_to be_valid
        end
      end
    end

    context 'when our pawn is not on fourth row' do
      let(:last_movement) { nil }
      let(:end_position) { [4, 1] }
      before do
        board.data[3][0] = black_pawn
      end
      it 'returns false' do
        expect(black_en_passant).not_to be_valid
      end
    end
  end

  describe '#apply' do
    let(:last_movement) { nil }
    let(:end_position) { [5, 1] }
    before do
      board.data[4][0] = black_pawn
      board.data[4][1] = white_pawn
      black_en_passant.apply
    end

    it 'removes the enemy pawn' do
      expect(board.data[4][1]).to eq(nil)
    end

    it 'moves the black pawn to the right position' do
      expect(board.data[5][1]).to eq(black_pawn)
    end

    it 'removes the black pawn from the original position' do
      expect(board.data[4][0]).to eq(nil)
    end
  end
end
