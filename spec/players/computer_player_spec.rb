# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe ComputerPlayer do
  subject(:computer_player) { described_class.new(board) }
  let(:board) { Board.new }
  describe '#play_round' do
    context 'when the board was just set' do
      before do
        allow(computer_player).to receive(:puts)
        allow(computer_player).to receive(:sleep)
        board.set
        computer_player.play_round
      end

      it 'moves either a black pawn or a black knight' do
        expect(board.data[0..1].flatten).to include(a_kind_of(NilPiece))
      end
    end
  end
end
