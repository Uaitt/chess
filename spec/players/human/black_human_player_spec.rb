# frozen_string_literal: true

require 'colorize'
require 'require_all'

require_all "#{__dir__}/../../../lib/"

describe BlackHumanPlayer do
  subject(:black_human_player) { described_class.new('Leonardo', board) }

  let(:board) { Board.new }

  before do
    board.set
  end

  describe '#play_round' do
    before do
      allow(board).to receive(:show)
    end

    context 'when the player enters two valid coordinates in a row' do
      before do
        allow(black_human_player).to receive(:gets).and_return('a7', 'a5')
      end

      it 'applies the right movement' do
        black_human_player.play_round
        expect(board.piece_at([3, 0])).to be_instance_of(BlackPawn)
      end
    end

    context 'when the player enters a valid coordinate, an out of bound one and a valid one at the end' do
      before do
        allow(black_human_player).to receive(:gets).and_return('b9', 'b8', 'c6')
      end

      it 'applies the right movement' do
        black_human_player.play_round
        expect(board.piece_at([2, 2])).to be_instance_of(BlackKnight)
      end
    end

    context 'when when the player enters a coordinate occupied by a white piece, and two valid coordinates in a rowe' do
      before do
        allow(black_human_player).to receive(:gets).and_return('b1', 'b8', 'c6')
      end

      it 'applies the right movement' do
        black_human_player.play_round
        expect(board.piece_at([2, 2])).to be_instance_of(BlackKnight)
      end
    end

    context 'when when the player enters an out of bound coordinate, and two valid coordinates in a row' do
      before do
        allow(black_human_player).to receive(:gets).and_return('a9', 'a7', 'a6')
      end

      it 'applies the right movement' do
        black_human_player.play_round
        expect(board.piece_at([2, 0])).to be_instance_of(BlackPawn)
      end
    end

    context 'when the player enters \'save\'' do
      before do
        allow(black_human_player).to receive(:gets).and_return('save')
      end

      it 'does not ask for an end position and returns' do
        black_human_player.play_round
        expect(black_human_player).to have_received(:gets).once
      end
    end
  end
end
