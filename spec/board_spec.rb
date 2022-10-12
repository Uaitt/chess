# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/pieces/knight'

describe Board do
  subject(:board) { described_class.new }

  describe '#set' do
    let(:data) { board.instance_variable_get(:@data) }
    before do
      board.set
    end
    
    it 'places a rook on the first square of top row' do
      expect(data[0][0].class).to eq(Rook)
    end

    it 'places a knight on the second square of tow row' do
      expect(data[0][1].class).to eq(Knight)
    end

    it 'places a bishop on the third square of top row' do
      expect(data[0][2].class).to eq(Bishop)
    end

    it 'places a queen on the fourth square of top row' do
      expect(data[0][3].class).to eq(Queen)
    end

    it 'places a king on the fifth square of top row' do
      expect(data[0][4].class).to eq(King)
    end

    it 'places a bishop on the sixth square of top row' do
      expect(data[0][5].class).to eq(Bishop)
    end

    it 'places a knight on the seventh square of top row' do
      expect(data[0][6].class).to eq(Knight)
    end

    it 'places a rook on the eighth square of top row' do
      expect(data[0][7].class).to eq(Rook)
    end
  end

  describe '#move' do
    let(:knight) { Knight.new }
    before do
      data = Array.new(8) { Array.new(8, nil) }
      data[0][1] = knight
      board.instance_variable_set(:@data, data)
    end

    context 'when given a knight and a position' do
      it 'moves the knight to the exact position' do
        end_position = [3, 3]
        board.move(knight, end_position)
        result_data = board.instance_variable_get(:@data)
        expected_data = Array.new(8) { Array.new(8, nil) }
        expected_data[end_position[0]][end_position[1]] = knight
        expect(result_data).to eq(expected_data)
      end
    end

    context 'when given a knight and a different position' do
      it 'moves the knight to the exact position' do
        end_position = [1, 6]
        board.move(knight, end_position)
        result_data = board.instance_variable_get(:@data)
        expected_data = Array.new(8) { Array.new(8, nil) }
        expected_data[end_position[0]][end_position[1]] = knight
        expect(result_data).to eq(expected_data)
      end
    end
  end
end
