# frozen_string_literal: true

require 'colorize'
require 'require_all'

require_all "#{__dir__}/../../lib/"

describe ComputerPlayer do
  subject(:computer_player) { described_class.new(board) }

  let(:board) { Board.new }

  describe '#play_round' do
    context 'when the board was just set' do
      before do
        board.set
        computer_player.play_round
      end

      it 'moves either a black pawn or a black knight' do
        expect(board.data[0..1].flatten).to include(a_kind_of(NilPiece))
      end
    end
  end
end
