# frozen_string_literal: true

require_relative '../../lib/pieces/queen'

describe Queen do
  subject(:queen) { described_class.new(:white) }
  describe '#able_to_reach?' do
    context 'when the position is reachable' do
      it 'returns true' do
        expect(queen.able_to_reach?([0, 0], [1, 0])).to eq(true)
      end

      it 'returns true' do
        expect(queen.able_to_reach?([0, 0], [1, 1])).to eq(true)
      end
    end

    context 'when the position is not reachable' do
      it 'returns false' do
        expect(queen.able_to_reach?([0, 0], [1, 2])).to eq(false)
      end
    end
  end
end
