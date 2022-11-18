# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe WhiteBishopMovement do
  subject { described_class.new(board, white_bishop, end_position) }
  let(:white_bishop) { WhiteBishop.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end

  describe '::moving?' do
    let(:end_position) { [] }
    context 'when given a WhiteBishop' do
      it 'returns true' do
        expect(WhiteBishopMovement).to be_moving(WhiteBishop.new, end_position)
      end
    end

    context 'when given a BlackBishop' do
      it 'returns false' do
        expect(WhiteBishopMovement).not_to be_moving(BlackBishop.new, end_position)
      end
    end

    context 'when given a BlackPiece' do
      it 'returns false' do
        expect(WhiteBishopMovement).not_to be_moving(BlackPiece.new, end_position)
      end
    end
  end

  describe '#valid?' do
    context 'when the bishop is placed in the top left corner' do
      before do
        board.place_piece(white_bishop, [0, 0])
      end

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [1, 1] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [1, 1])
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

      context 'when the movement is four steps towards bottom right corner' do
        let(:end_position) { [4, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [2, 2])
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
            board.place_piece(piece, [4, 4])
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
        board.place_piece(white_bishop, [3, 5])
      end
      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 6] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [4, 6])
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

      context 'when the movement is one step towards bottom left corner' do
        let(:end_position) { [4, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [4, 4])
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

      context 'when the movement is two steps towards top left corner' do
        let(:end_position) { [1, 3] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [2, 4])
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
            board.place_piece(piece, [1, 3])
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

      context 'when the movement is two steps towards top right corner' do
        let(:end_position) { [1, 7] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [2, 6])
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
            board.place_piece(piece, [1, 7])
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
      board.place_piece(WhiteKing.new, [0, 0])
      board.place_piece(white_bishop, [1, 1])
      board.place_piece(BlackBishop.new, [2, 2])
    end
    context 'when it puts its own king in check' do
      let(:end_position) { [0, 2] }
      it 'returns true' do
        expect(subject.checks_own_king?).to eq(true)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([0, 2])).to be_instance_of(NilPiece)
      end
    end

    context 'when it does not put its own king in check' do
      let(:end_position) { [2, 2] }
      it 'returns false' do
        expect(subject.checks_own_king?).to eq(false)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([2, 2])).to be_instance_of(BlackBishop)
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [2, 2] }
    before do
      board.place_piece(white_bishop, [0, 0])
      subject.apply
    end
    it 'places the bishop on the right position' do
      expect(board.piece_at([2, 2])).to eq(white_bishop)
    end

    it 'removes the bishop from the initial position' do
      expect(board.piece_at([0, 0])).to be_instance_of(NilPiece)
    end
  end

  describe '#double_moving?' do
    let(:end_position) { [2, 2] }
    it 'returns false' do
      expect(subject).not_to be_double_moving(WhitePawn.new)
    end
  end

  describe '#direction' do
    before do
      board.place_piece(white_bishop, [3, 5])
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
