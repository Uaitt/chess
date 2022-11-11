# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe WhiteRookMovement do
  subject { described_class.new(board, white_rook, end_position) }
  let(:white_rook) { WhiteRook.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end

  describe '::moving?' do
    let(:end_position) { [] }
    context 'when given a WhiteRook' do
      it 'returns true' do
        expect(WhiteRookMovement).to be_moving(WhiteRook.new, end_position)
      end
    end

    context 'when given a BlackRook' do
      it 'returns false' do
        expect(WhiteRookMovement).not_to be_moving(BlackRook.new, end_position)
      end
    end

    context 'when given a BlackPiece' do
      it 'returns false' do
        expect(WhiteRookMovement).not_to be_moving(BlackPiece.new, end_position)
      end
    end
  end

  describe '#valid?' do
    context 'when the rook is placed on the top left corner' do
      before do
        board.data[0][0] = white_rook
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
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[0][1] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is three steps towards bottom' do
        let(:end_position) { [3, 0] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[2][0] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[3][0] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is three step towards bottom right corner' do
        let(:end_position) { [3, 3] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [2, 1] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when the bishop is placed in a random position' do
      before do
        board.data[3][5] = white_rook
      end
      context 'when the movement is one step towards bottom' do
        let(:end_position) { [4, 5] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[4][5] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 5] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[2][5] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards right' do
        let(:end_position) { [3, 7] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][6] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[3][7] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards top left' do
        let(:end_position) { [3, 3] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.data[3][4] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.data[3][3] = piece
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two steps towards bottom right corner' do
        let(:end_position) { [5, 7] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards bottom left corner' do
        let(:end_position) { [5, 3] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards top left corner' do
        let(:end_position) { [2, 4] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards top right corner' do
        let(:end_position) { [2, 6] }
        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#checks_own_king?' do
    before do
      board.data[0][0] = WhiteKing.new
      board.data[1][0] = white_rook
      board.data[2][0] = BlackRook.new
    end
    context 'when it puts its own king in check' do
      let(:end_position) { [1, 1] }
      it 'returns true' do
        expect(subject.checks_own_king?).to eq(true)
      end

      it 'does not apply the movement' do
        expect(board.data[1][1]).to be_instance_of(NilPiece)
      end
    end

    context 'when it does not put its own king in check' do
      let(:end_position) { [2, 0] }
      it 'returns false' do
        expect(subject.checks_own_king?).to eq(false)
      end

      it 'does not apply the movement' do
        expect(board.data[2][0]).to be_instance_of(BlackRook)
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [3, 0] }
    before do
      board.data[0][0] = white_rook
      subject.apply
    end
    it 'places the bishop on the right position' do
      expect(board.data[3][0]).to eq(white_rook)
    end

    it 'removes the bishop from the initial position' do
      expect(board.data[0][0]).to be_instance_of(NilPiece)
    end
  end

  describe '#double_moving?' do
    let(:end_position) { [3, 0] }
    it 'returns false' do
      expect(subject).not_to be_double_moving(WhitePawn.new)
    end
  end
  describe '#direction' do
    before do
      board.data[3][3] = white_rook
    end

    context 'when the movement is from top to bottom' do
      let(:end_position) { [6, 3] }
      it 'returns [1, 0]' do
        expect(subject.direction).to eq([1, 0])
      end
    end

    context 'when the movement is from bottom to top' do
      let(:end_position) { [0, 3] }
      it 'returns [-1, 0]' do
        expect(subject.direction).to eq([-1, 0])
      end
    end

    context 'when the movement is from left to right' do
      let(:end_position) { [3, 6] }
      it 'returns [0, 1]' do
        expect(subject.direction).to eq([0, 1])
      end
    end

    context 'when the movement is from right to left' do
      let(:end_position) { [3, 0] }
      it 'returns [0, -1]' do
        expect(subject.direction).to eq([0, -1])
      end
    end
  end
end
