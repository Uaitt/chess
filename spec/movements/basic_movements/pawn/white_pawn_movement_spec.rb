# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe WhitePawnMovement do
  subject { described_class.new(board, white_pawn, end_position) }
  let(:white_pawn) { WhitePawn.new }
  let(:piece) { color_class.new }
  let(:board) { Board.new }
  before do
    board.instance_variable_set(:@data, Array.new(8) { Array.new(8, NilPiece.new) })
  end

  describe '::moving?' do
    context 'when given a WhitePawn' do
      it 'returns true' do
        expect(WhitePawnMovement).to be_moving(WhitePawn.new)
      end
    end

    context 'when given a BlackPawn' do
      it 'returns false' do
        expect(WhitePawnMovement).not_to be_moving(BlackPawn.new)
      end
    end

    context 'when given a BlackPiece' do
      it 'returns false' do
        expect(WhitePawnMovement).not_to be_moving(BlackPiece.new)
      end
    end
  end

  describe '#valid?' do
    context 'when it is placed in a random position' do
      before do
        board.data[3][4] = white_pawn
      end

      context 'when the movement is one step towards top' do
        let(:end_position) { [2, 4] }
        context 'when it is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when the movement is blocked' do
          before do
            board.data[2][4] = piece
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
            board.data[2][5] = piece
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
        board.data[6][0] = white_pawn
      end

      context 'when the movement is one steps towards top' do
        let(:end_position) { [5, 0] }
        context 'when the movement is not blocked by any piece' do
          it { is_expected.to be_valid }
        end

        context 'when it is blocked' do
          before do
            board.data[5][0] = piece
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
            board.data[5][0] = piece
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
            board.data[4][0] = piece
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
      board.data[0][0] = WhiteKing.new
      board.data[0][1] = white_pawn
      board.data[1][0] = BlackRook.new
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
      let(:end_position) { [1, 0] }
      it 'returns false' do
        expect(subject.checks_own_king?).to eq(false)
      end

      it 'does not apply the movement' do
        expect(board.data[1][0]).to be_instance_of(BlackRook)
      end
    end
  end

  describe '#apply' do
    let(:end_position) { [1, 0] }
    before do
      board.data[0][0] = white_pawn
      subject.apply
    end
    it 'places the pawn on the right position' do
      expect(board.data[1][0]).to eq(white_pawn)
    end

    it 'removes the pawn from the initial position' do
      expect(board.data[0][0]).to be_instance_of(NilPiece)
    end
  end

  describe '#allows_en_passant?' do
    before do
      board.data[0][0] = white_pawn
    end

    context 'when the movement is a double leap' do
      let(:end_position) { [2, 0] }
      context 'when it moves that pawn' do
        it 'returns true' do
          expect(subject.allows_en_passant?(white_pawn)).to eq(true)
        end
      end

      context 'when it does not move that pawn' do
        it 'returns false' do
          white_pawn = WhitePawn.new
          expect(subject.allows_en_passant?(white_pawn)).to eq(false)
        end
      end
    end

    context 'when the movement is not a double leap' do
      let(:end_position) { [1, 0] }
      it 'returns false' do
        expect(subject.allows_en_passant?(white_pawn)).to eq(false)
      end
    end
  end
end
