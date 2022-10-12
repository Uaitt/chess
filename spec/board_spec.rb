# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/pieces/knight'

describe Board do
  subject(:board) { described_class.new }
  describe '#move' do
    let(:knight) { double(Knight) }
    before do
      data = Array.new(8) { Array.new(8, nil) }
      data[0][1] = knight
      board.instance_variable_set(:@data, data)
    end

    context 'when given a knight' do
      it 'moves the knight to the exact position' do
        board.move(knight, [3, 3])
        result_data = board.instance_variable_get(:@data)
        expected_data =  Array.new(8) { Array.new(8, nil) }
        expected_data[3, 3] = knight
        expect(result_data).to eq(expected_data)
      end
    end
  end
end
