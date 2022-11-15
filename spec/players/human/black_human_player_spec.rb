# frozen_string_literal: true

require 'require_all'

require_all 'lib'

describe BlackHumanPlayer do
  subject(:black_human_player) { described_class.new('Leonardo', board) }
  let(:board) { Board.new }
  before do
    board.set
  end

  context '#play_round' do
    before do
      allow(black_human_player).to receive(:puts)
    end

    context 'when the player enters a valid start coordinate' do
      context 'when the player enters a valid end coordinate' do
        before do
          allow(black_human_player).to receive(:gets).and_return('a7', 'a5')
        end
        it 'applies the right movement' do
          black_human_player.play_round
          expect(board.piece_at([3, 0])).to be_instance_of(BlackPawn)
        end
      end

      context 'when the player enters an invalid end coordinate, and a valid end coordinate' do
        before do
          allow(black_human_player).to receive(:gets).and_return('b8', 'c7', 'c6')
        end

        it 'applies the right movement' do
          black_human_player.play_round
          expect(board.piece_at([2, 2])).to be_instance_of(BlackKnight)
        end
      end
    end

    context 'when the player enters an invalid start coordinate' do
      context 'when the player enters a valid start coordinate and a valid end coordinate' do
        before do
          allow(black_human_player).to receive(:gets).and_return('a2', 'a7', 'a6')
        end

        it 'applies the right movement' do
          black_human_player.play_round
          expect(board.piece_at([2, 0])).to be_instance_of(BlackPawn)
        end
      end
    end

    context 'when the player enters \'save\'' do
      before do
        allow(black_human_player).to receive(:gets).and_return('save')
      end

      it 'does not ask for an end position and returns' do
        expect(black_human_player).to receive(:gets).once
        black_human_player.play_round
      end
    end
  end
end
