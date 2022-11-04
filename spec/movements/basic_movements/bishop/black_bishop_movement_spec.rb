# frozen_string_literal: true

require_relative '../../../../lib/movements/basic_movements/bishop/black_bishop_movement'
require_relative '../../../../lib/movements/basic_movements/bishop/white_bishop_movement'
require_relative '../../../../lib/movements/basic_movements/king/black_king_movement'
require_relative '../../../../lib/movements/basic_movements/king/white_king_movement'
require_relative '../../../../lib/movements/basic_movements/knight/black_knight_movement'
require_relative '../../../../lib/movements/basic_movements/knight/white_knight_movement'
require_relative '../../../../lib/movements/basic_movements/pawn/black_pawn_movement'
require_relative '../../../../lib/movements/basic_movements/pawn/white_pawn_movement'
require_relative '../../../../lib/movements/basic_movements/queen/black_queen_movement'
require_relative '../../../../lib/movements/basic_movements/queen/white_queen_movement'
require_relative '../../../../lib/movements/basic_movements/rook/black_rook_movement'
require_relative '../../../../lib/movements/basic_movements/rook/white_rook_movement'
require_relative '../../../../lib/movements/basic_movements/nil_movement'
require_relative '../../../../lib/pieces/king/black_king'
require_relative '../../../../lib/pieces/bishop/black_bishop'
require_relative '../../../../lib/pieces/bishop/white_bishop'
require_relative '../../../../lib/pieces/pawn/black_pawn'
require_relative '../../../../lib/pieces/white_piece'
require_relative '../../../../lib/pieces/nil_piece'
require_relative '../../../../lib/board'

describe BlackBishopMovement do
  subject { described_class.new(board, black_bishop, end_position) }
  let(:black_bishop) { BlackBishop.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end
  describe '#valid?' do
    context 'when the bishop is placed in the top left corner' do
      before do
        board.data[0][0] = black_bishop
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[1][1] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is four steps towards bottom right corner' do
        let(:end_position) { [4, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][2] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[4][4] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is four steps towards bottom' do
        let(:end_position) { [4, 0] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is four step towards right' do
        let(:end_position) { [0, 4] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when the bishop is placed in a random position' do
      before do
        board.data[3][5] = black_bishop
      end
      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 6] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[4][6] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards bottom left corner' do
        let(:end_position) { [4, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[4][4] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards top left corner' do
        let(:end_position) { [1, 3] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][4] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[1][3] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards top right corner' do
        let(:end_position) { [1, 7] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][6] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[1][7] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards bottom' do
        let(:end_position) { [5, 5] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards top' do
        let(:end_position) { [1, 5] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards bottom and two towards left' do
        let(:end_position) { [4, 3] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two step towards top and one towards right' do
        let(:end_position) { [5, 6] }
        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#checks_own_king?' do
    before do
      board.data[0][0] = BlackKing.new
      board.data[1][1] = black_bishop
      board.data[2][2] = WhiteBishop.new
    end
    context 'when it puts its own king in check' do
      let(:end_position) { [0, 2] }
      it 'returns true' do
        expect(subject.checks_own_king?).to eq(true)
      end

      it 'does not apply the movement' do
        expect(board.data[0][2]).to be_instance_of(NilPiece)
      end
    end

    context 'when it does not put its own king in check' do
      let(:end_position) { [2, 2] }
      it 'returns false' do
        expect(subject.checks_own_king?).to eq(false)
      end

      it 'does not apply the movement' do
        expect(board.data[2][2]).to be_instance_of(WhiteBishop)
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [2, 2] }
    before do
      board.data[0][0] = black_bishop
      subject.apply
    end
    it 'places the bishop on the right position' do
      expect(board.data[2][2]).to eq(black_bishop)
    end

    it 'removes the bishop from the initial position' do
      expect(board.data[0][0]).to be_instance_of(NilPiece)
    end
  end

  describe '#allows_en_passant?' do
    let(:end_position) { [2, 2] }
    it 'returns false' do
      expect(subject.allows_en_passant?(BlackPawn.new)).to eq(false)
    end
  end

  describe '#direction' do
    before do
      board.data[3][5] = black_bishop
    end

    context 'when the movement is towards bottom right corner' do
      let(:end_position) { [4, 6] }
      it 'returns [1, 1]' do
        expect(subject.direction).to eq([1, 1])
      end
    end

    context 'when the movement is towards top left corner' do
      let(:end_position) { [0, 2] }
      it 'returns [-1, -1]' do
        expect(subject.direction).to eq([-1, -1])
      end
    end

    context 'when the movement is towards bottom left corner' do
      let(:end_position) { [4, 4] }
      it 'returns [1, -1]' do
        expect(subject.direction).to eq([1, -1])
      end
    end

    context 'when the movement is towards top right corner' do
      let(:end_position) { [1, 7] }
      it 'returns [-1, 1]' do
        expect(subject.direction).to eq([-1, 1])
      end
    end
  end
end
