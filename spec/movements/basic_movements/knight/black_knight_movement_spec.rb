# frozen_string_literal: true

require 'require_all'

require_all "#{__dir__}/../../../../lib/"

describe BlackKnightMovement do
  subject { described_class.new(board, black_knight, end_position) }

  let(:black_knight) { BlackKnight.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }

  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end

  describe '::moving?' do
    let(:end_position) { [] }

    context 'when moving a BlackKnight' do
      it 'returns true' do
        expect(BlackKnightMovement).to be_moving(BlackKnight.new, end_position)
      end
    end

    context 'when moving a WhiteKnight' do
      it 'returns false' do
        expect(BlackKnightMovement).not_to be_moving(WhiteKnight.new, end_position)
      end
    end

    context 'when moving a WhitePiece' do
      it 'returns false' do
        expect(BlackKnightMovement).not_to be_moving(WhitePiece.new, end_position)
      end
    end
  end

  describe '#valid?' do
    context 'when the knight is placed in the top left corner' do
      before do
        board.place_piece(black_knight, [0, 0])
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [1, 2] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [1, 0])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [1, 2])
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

        context 'when the movement is two steps towards bottom and one towards right' do
          let(:end_position) { [2, 1] }

          context 'when it is not blocked' do
            it { is_expected.to be_valid }
          end

          context 'when it is blocked on transition' do
            before do
              board.place_piece(piece, [0, 1])
            end

            context 'when the blocking piece is of the opposite color' do
              let(:color_class) { WhitePiece }

              it { is_expected.to be_valid }
            end

            context 'when the blocking piece is of the same color' do
              let(:color_class) { BlackPiece }

              it { is_expected.to be_valid }
            end
          end

          context 'when it is blocked on arrival' do
            before do
              board.place_piece(piece, [2, 1])
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

        context 'when the movement is one step towards bottom right corner' do
          let(:end_position) { [1, 1] }

          it { is_expected.not_to be_valid }
        end

        context 'when the movement is one step towards bottom and three towards right' do
          let(:end_position) { [1, 3] }

          it { is_expected.not_to be_valid }
        end
      end
    end

    context 'when the knight is placed in a random position' do
      before do
        board.place_piece(black_knight, [3, 4])
      end

      context 'when the movement is one step towards bottom and two towards right' do
        let(:end_position) { [4, 6] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [4, 4])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [4, 6])
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

      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [5, 5] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [3, 5])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [5, 5])
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

      context 'when the movement is one step towards top and two towards left' do
        let(:end_position) { [2, 2] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [2, 4])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [2, 2])
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

      context 'when the movement is twp steps towards top and ond towards left' do
        let(:end_position) { [1, 3] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [3, 3])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [1, 3])
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

      context 'when the movement is one step towards bottom and two towards left' do
        let(:end_position) { [4, 2] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [3, 0])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [4, 2])
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

      context 'when the movement is two steps towards bottom and one towards left' do
        let(:end_position) { [5, 3] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [3, 3])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [5, 3])
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

      context 'when the movement is one step towards top and two towards right' do
        let(:end_position) { [2, 6] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [2, 4])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [2, 6])
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

      context 'when the movement is two steps towards bottom and one towards right' do
        let(:end_position) { [1, 5] }

        context 'when it is not blocked' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked on transition' do
          before do
            board.place_piece(piece, [3, 5])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }

            it { is_expected.to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }

            it { is_expected.to be_valid }
          end
        end

        context 'when it is blocked on arrival' do
          before do
            board.place_piece(piece, [1, 5])
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

      context 'when the movement is one step towards top and three towards left' do
        let(:end_position) { [2, 1] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards bottom and one towards left' do
        let(:end_position) { [4, 3] }

        it { is_expected.not_to be_valid }
      end

      context 'when the movement is three steps towards bottom and one towards left' do
        let(:end_position) { [6, 3] }

        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#checks_own_king?' do
    before do
      board.place_piece(BlackKing.new, [0, 0])
      board.place_piece(black_knight, [1, 0])
    end

    context 'when it puts its own king in check' do
      let(:end_position) { [2, 2] }

      it 'returns true' do
        board.place_piece(WhiteRook.new, [2, 0])
        expect(subject.checks_own_king?).to eq(true)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([2, 2])).to be_instance_of(NilPiece)
      end
    end

    context 'when it does not put its own king in check' do
      let(:end_position) { [2, 2] }

      it 'returns false' do
        expect(subject.checks_own_king?).to eq(false)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([1, 0])).to be_instance_of(BlackKnight)
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [1, 2] }

    before do
      board.place_piece(black_knight, [0, 0])
      subject.apply
    end

    it 'places the bishop on the right position' do
      expect(board.piece_at([1, 2])).to eq(black_knight)
    end

    it 'removes the bishop from the initial position' do
      expect(board.piece_at([0, 0])).to be_instance_of(NilPiece)
    end
  end

  describe '#double_moving?' do
    let(:end_position) { [1, 2] }

    it 'returns false' do
      expect(subject).not_to be_double_moving(BlackPawn.new)
    end
  end

  describe '#direction' do
    before do
      board.place_piece(black_knight, [3, 4])
    end

    context 'when the movement is one step towards top and two towards left' do
      let(:end_position) { [2, 2] }

      it 'returns [-1, -2]' do
        expect(subject.direction).to eq([-1, -2])
      end
    end

    context 'when the movement is two steps towards top and one towards left' do
      let(:end_position) { [1, 3] }

      it 'returns [-2, -1]' do
        expect(subject.direction).to eq([-2, -1])
      end
    end

    context 'when the movement is two steps towards top and one towards right' do
      let(:end_position) { [1, 5] }

      it 'returns [-2, 1]' do
        expect(subject.direction).to eq([-2, 1])
      end
    end

    context 'when the movement is one step towards top and two towards right' do
      let(:end_position) { [2, 6] }

      it 'returns [-1, 2]' do
        expect(subject.direction).to eq([-1, 2])
      end
    end

    context 'when the movement is one step towards bottom and two towards right' do
      let(:end_position) { [4, 6] }

      it 'returns [1, 2]' do
        expect(subject.direction).to eq([1, 2])
      end
    end

    context 'when the movement is two steps towards bottom and one towards right' do
      let(:end_position) { [5, 5] }

      it 'returns [2, 1]' do
        expect(subject.direction).to eq([2, 1])
      end
    end

    context 'when the the movement is one step towards bottom and two towards left' do
      let(:end_position) { [4, 2] }

      it 'returns [1, -2]' do
        expect(subject.direction).to eq([1, -2])
      end
    end

    context 'when the movement is two steps towards bottom and one towards left' do
      let(:end_position) { [5, 3] }

      it 'returns [2, -1]' do
        expect(subject.direction).to eq([2, -1])
      end
    end
  end
end
