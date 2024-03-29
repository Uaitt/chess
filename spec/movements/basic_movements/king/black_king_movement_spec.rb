# frozen_string_literal: true

require 'require_all'

require_all "#{__dir__}/../../../../lib/"

describe BlackKingMovement do
  subject { described_class.new(board, black_king, end_position) }

  let(:black_king) { BlackKing.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }

  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end

  describe '::moving?' do
    let(:end_position) { [] }

    context 'when given a BlackKing' do
      it 'returns true' do
        expect(BlackKingMovement).to be_moving(BlackKing.new, end_position)
      end
    end

    context 'when given a WhiteKing' do
      it 'returns false' do
        expect(BlackKingMovement).not_to be_moving(WhiteKing.new, end_position)
      end
    end

    context 'when given a WhitePiece' do
      it 'returns false' do
        expect(BlackKingMovement).not_to be_moving(WhitePiece.new, end_position)
      end
    end
  end

  describe '#valid?' do
    context 'when the king is placed in the top left corner' do
      before do
        board.place_piece(black_king, [0, 0])
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [1, 0] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [1, 0])
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

      context 'when the movement is one step towards right' do
        let(:end_position) { [0, 1] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [0, 1])
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
        let(:end_position) { [2, 0] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is three steps towards right' do
        let(:end_position) { [0, 3] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards bottom right corner' do
        let(:end_position) { [2, 2] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards bottom and three towards right' do
        let(:end_position) { [1, 3] }

        it { is_expected.not_to be_valid }
      end
    end

    context 'when the king is placed in a random position' do
      before do
        board.place_piece(black_king, [3, 4])
      end

      context 'when the movement is one step towards bottom' do
        let(:end_position) { [4, 4] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [4, 4])
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

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 4] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [2, 4])
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

      context 'when the movement is one step towards right' do
        let(:end_position) { [3, 5] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [3, 5])
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

      context 'when the movement is one step towards left' do
        let(:end_position) { [3, 3] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [3, 3])
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

      context 'when the movement is one step towards bottom right corner' do
        let(:end_position) { [4, 5] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [4, 5])
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
        let(:end_position) { [4, 3] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [4, 3])
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

      context 'when the movement is one step towards top left corner' do
        let(:end_position) { [2, 3] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [2, 3])
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

      context 'when the movement is one step towards top right corner' do
        let(:end_position) { [2, 5] }

        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [2, 5])
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
        let(:end_position) { [5, 4] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards top' do
        let(:end_position) { [1, 4] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards bottom and one towards left' do
        let(:end_position) { [5, 3] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards top and two towards right' do
        let(:end_position) { [2, 6] }

        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#checks_own_king?' do
    before do
      board.place_piece(black_king, [1, 0])
      board.place_piece(WhiteBishop.new, [1, 1])
    end

    context 'when it puts its own king in check' do
      let(:end_position) { [0, 0] }

      it 'returns true' do
        expect(subject.checks_own_king?).to eq(true)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([0, 0])).to be_instance_of(NilPiece)
      end
    end

    context 'when it does not put its own king in check' do
      let(:end_position) { [1, 1] }

      it 'returns false' do
        expect(subject.checks_own_king?).to eq(false)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([1, 1])).to be_instance_of(WhiteBishop)
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [1, 1] }

    before do
      board.place_piece(black_king, [0, 0])
      subject.apply
    end

    it 'places the bishop on the right position' do
      expect(board.piece_at([1, 1])).to eq(black_king)
    end

    it 'removes the bishop from the initial position' do
      expect(board.piece_at([0, 0])).to be_instance_of(NilPiece)
    end
  end

  describe '#double_moving?' do
    let(:end_position) { [1, 1] }

    it 'returns false' do
      expect(subject).not_to be_double_moving(BlackPawn.new)
    end
  end

  describe '#direction' do
    before do
      board.place_piece(black_king, [3, 4])
    end

    context 'when the movement is one step towards bottom' do
      let(:end_position) { [4, 4] }

      it 'returns [1, 0]' do
        expect(subject.direction).to eq([1, 0])
      end
    end

    context 'when the movement is one step towards top' do
      let(:end_position) { [2, 4] }

      it 'returns [-1, 0]' do
        expect(subject.direction).to eq([-1, 0])
      end
    end

    context 'when the movement is one step towards right' do
      let(:end_position) { [3, 5] }

      it 'returns [0, 1]' do
        expect(subject.direction).to eq([0, 1])
      end
    end

    context 'when the movement is one step towards left' do
      let(:end_position) { [3, 3] }

      it 'returns [0, -1]' do
        expect(subject.direction).to eq([0, -1])
      end
    end

    context 'when the movement is one step towards top right corner' do
      let(:end_position) { [2, 5] }

      it 'returns [-1, 1]' do
        expect(subject.direction).to eq([-1, 1])
      end
    end

    context 'when the movement is one step towards bottom right corner' do
      let(:end_position) { [4, 5] }

      it 'returns [1, 1]' do
        expect(subject.direction).to eq([1, 1])
      end
    end

    context 'when the movement is one step towards top left corner' do
      let(:end_position) { [2, 3] }

      it 'returns [-1, -1]' do
        expect(subject.direction).to eq([-1, -1])
      end
    end

    context 'when the movement is one step towards bottom left corner' do
      let(:end_position) { [4, 3] }

      it 'returns [1, -1]' do
        expect(subject.direction).to eq([1, -1])
      end
    end
  end
end
