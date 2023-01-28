# frozen_string_literal: true

require 'colorize'
require 'require_all'

require_all "#{__dir__}/../../../lib/"

describe WhiteHumanPlayer do
  subject(:white_human_player) { described_class.new('Lorenzo', board) }

  let(:board) { Board.new }

  before do
    board.set
  end

  describe '#play_round' do
    before do
      allow(white_human_player).to receive(:puts)
      allow(board).to receive(:show)
    end

    context 'when the player enters a valid start coordinate straight away' do
      context 'when the player enters a valid end coordinate straight away' do
        before do
          allow(white_human_player).to receive(:gets).and_return('a2', 'a4')
        end

        it 'applies the right movement' do
          white_human_player.play_round
          expect(board.piece_at([4, 0])).to be_instance_of(WhitePawn)
        end
      end

      context 'when the player first enters an out of bound end coordinate, but then a valid end coordinate' do
        before do
          allow(white_human_player).to receive(:gets).and_return('b0', 'b1', 'c3')
        end

        it 'applies the right movement' do
          white_human_player.play_round
          expect(board.piece_at([5, 2])).to be_instance_of(WhiteKnight)
        end
      end

      context 'when the player first enters an opponent piece end coordinate, but then a valid end coordinate' do
        before do
          allow(white_human_player).to receive(:gets).and_return('b8', 'b1', 'c3')
        end

        it 'applies the right movement' do
          white_human_player.play_round
          expect(board.piece_at([5, 2])).to be_instance_of(WhiteKnight)
        end
      end
    end

    context 'when the player first enters an invalid start coordinate' do
      context 'when the player then enters a valid start coordinate and a valid end coordinate' do
        before do
          allow(white_human_player).to receive(:gets).and_return('a7', 'a2', 'a3')
        end

        it 'applies the right movement' do
          white_human_player.play_round
          expect(board.piece_at([5, 0])).to be_instance_of(WhitePawn)
        end
      end
    end

    context 'when the player enters \'save\'' do
      before do
        allow(white_human_player).to receive(:gets).and_return('save')
      end

      it 'does not ask for an end position and returns' do
        expect(white_human_player).to receive(:gets).once
        white_human_player.play_round
      end
    end
  end
end
