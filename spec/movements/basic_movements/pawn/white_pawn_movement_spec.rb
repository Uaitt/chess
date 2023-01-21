# frozen_string_literal: true

require 'colorize'
require 'require_all'

require_all "#{__dir__}/../../../../lib/"

describe WhitePawnMovement do
  subject { described_class.new(board, white_pawn, end_position) }
  let(:white_pawn) { WhitePawn.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end

  describe '::moving?' do
    let(:end_position) { [] }
    context 'when given a WhitePawn' do
      it 'returns true' do
        expect(WhitePawnMovement).to be_moving(WhitePawn.new, end_position)
      end
    end

    context 'when given a BlackPawn' do
      it 'returns false' do
        expect(WhitePawnMovement).not_to be_moving(BlackPawn.new, end_position)
      end
    end

    context 'when given a BlackPiece' do
      it 'returns false' do
        expect(WhitePawnMovement).not_to be_moving(BlackPiece.new, end_position)
      end
    end
  end

  describe '#valid?' do
    context 'when it is placed in a random position' do
      before do
        board.place_piece(white_pawn, [3, 4])
      end

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when the movement is blocked' do
          before do
            board.place_piece(piece, [2, 4])
          end
          context 'when the blocking piece is of the  color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is one step towards top right corner' do
        let(:end_position) { [2, 5] }

        context 'when it is not blocked by any piece' do
          it { is_expected.not_to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [2, 5])
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { BlackPiece }
            it { is_expected.to be_valid }
          end

          context 'when it is blocked by a piece of the same color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when the movement is two step towards top' do
        let(:end_position) { [1, 4] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is one step towards right' do
        let(:end_position) { [3, 5] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards right' do
        let(:end_position) { [3, 6] }
        it { is_expected.not_to be_valid }
      end

      context 'when the movement is two steps towards top right corner' do
        let(:end_position) { [1, 6] }
        it { is_expected.not_to be_valid }
      end
    end

    context 'when it is placed in the seventh row' do
      before do
        board.place_piece(white_pawn, [6, 0])
      end

      context 'when the movement is one steps towards top' do
        let(:end_position) { [5, 0] }
        context 'when the movement is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.place_piece(piece, [5, 0])
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
      end

      context 'when the movement is two steps towards top' do
        let(:end_position) { [4, 0] }
        context 'when the movement is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when the movement is blocked on transition' do
          before do
            board.place_piece(piece, [5, 0])
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

        context 'when the movement is blocked on arrival' do
          before do
            board.place_piece(piece, [4, 0])
          end

          context 'when the blocking piece is of the same color' do
            let(:color_class) { BlackPiece }
            it { is_expected.not_to be_valid }
          end

          context 'when the blocking piece is of the opposite color' do
            let(:color_class) { WhitePiece }
            it { is_expected.not_to be_valid }
          end
        end
      end
    end
  end

  describe '#checks_own_king?' do
    before do
      board.place_piece(WhiteKing.new, [0, 0])
      board.place_piece(white_pawn, [0, 1])
      board.place_piece(BlackRook.new, [1, 0])
    end
    context 'when it puts its own king in check' do
      let(:end_position) { [1, 1] }
      it 'returns true' do
        expect(subject.checks_own_king?).to eq(true)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([1, 1])).to be_instance_of(NilPiece)
      end
    end

    context 'when it does not put its own king in check' do
      let(:end_position) { [1, 0] }
      it 'returns false' do
        expect(subject.checks_own_king?).to eq(false)
      end

      it 'does not apply the movement' do
        expect(board.piece_at([1, 0])).to be_instance_of(BlackRook)
      end
    end
  end

  describe '#apply' do
    context 'when the pawn is on rank number 7' do
      let(:end_position) { [0, 0] }
      before do
        board.place_piece(white_pawn, [1, 0])
        allow(subject).to receive(:gets).and_return('white rook')
        allow(subject).to receive(:puts)
        subject.apply
      end

      it 'promotes the pawn to the input piece' do
        expect(board.piece_at([0, 0])).to be_instance_of(WhiteRook)
      end

      it 'removes the pawn from the initial position' do
        expect(board.piece_at([1, 0])).to be_instance_of(NilPiece)
      end
    end

    context 'when the pawn is not on rank number 7' do
      let(:end_position) { [1, 0] }
      before do
        board.place_piece(white_pawn, [0, 0])
        subject.apply
      end
      it 'places the pawn on the right position' do
        expect(board.piece_at([1, 0])).to eq(white_pawn)
      end

      it 'removes the pawn from the initial position' do
        expect(board.piece_at([0, 0])).to be_instance_of(NilPiece)
      end
    end
  end

  describe '#double_moving?' do
    before do
      board.place_piece(white_pawn, [0, 0])
    end

    context 'when the movement is a double leap' do
      let(:end_position) { [2, 0] }
      context 'when it moves that pawn' do
        it 'returns true' do
          expect(subject).to be_double_moving(white_pawn)
        end
      end

      context 'when it does not move that pawn' do
        it 'returns false' do
          white_pawn = WhitePawn.new
          expect(subject).not_to be_double_moving(white_pawn)
        end
      end
    end

    context 'when the movement is not a double leap' do
      let(:end_position) { [1, 0] }
      it 'returns false' do
        expect(subject).not_to be_double_moving(white_pawn)
      end
    end
  end

  describe '#direction' do
    before do
      board.place_piece(white_pawn, [6, 1])
    end

    context 'when the movement is towards top' do
      let(:end_position) { [5, 1] }
      it 'returns [-1, 0]' do
        expect(subject.direction).to eq([-1, 0])
      end
    end

    context 'when the movement is a double leap towards top' do
      let(:end_position) { [4, 1] }
      it 'returns [-1, 0]' do
        expect(subject.direction).to eq([-1, 0])
      end
    end

    context 'when the movement is towards top right corner' do
      let(:end_position) { [5, 2] }
      it 'returns [1, 1]' do
        expect(subject.direction).to eq([-1, 1])
      end
    end

    context 'when the movement is towards top left corner' do
      let(:end_position) { [5, 0] }
      it 'returns [1, 1]' do
        expect(subject.direction).to eq([-1, -1])
      end
    end
  end
end
