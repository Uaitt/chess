# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/rook'

describe Board do
  subject(:board) { described_class.new }

  describe '#set' do
    let(:data) { board.instance_variable_get(:@data) }
    before do
      board.set
    end

    it 'places only black pieces on the first row' do
      expect(data[0].all? { |piece| piece.color == :black }).to eq(true)
    end

    it 'places only black pieces on the second row' do
      expect(data[1].all? { |piece| piece.color == :black }).to eq(true)
    end

    it 'places only white pieces on the seventh row' do
      expect(data[6].all? { |piece| piece.color == :white }).to eq(true)
    end

    it 'places only white pieces on the eighth row' do
      expect(data[7].all? { |piece| piece.color == :white }).to eq(true)
    end

    it 'places a rook on the first square of the first row' do
      expect(data[0][0].instance_of?(Rook)).to eq(true)
    end

    it 'places a knight on the second square of the first row' do
      expect(data[0][1].instance_of?(Knight)).to eq(true)
    end

    it 'places a bishop on the third square of the first row' do
      expect(data[0][2].instance_of?(Bishop)).to eq(true)
    end

    it 'places a queen on the fourth square of the first row' do
      expect(data[0][3].instance_of?(Queen)).to eq(true)
    end

    it 'places a king on the fifth square of the first row' do
      expect(data[0][4].instance_of?(King)).to eq(true)
    end

    it 'places a bishop on the sixth square of the first row' do
      expect(data[0][5].instance_of?(Bishop)).to eq(true)
    end

    it 'places a knight on the seventh square of the first row' do
      expect(data[0][6].instance_of?(Knight)).to eq(true)
    end

    it 'places a rook on the eighth square of the first row' do
      expect(data[0][7].instance_of?(Rook)).to eq(true)
    end

    it 'places eight pawns on the second row' do
      expect(data[1].all? { |piece| piece.instance_of?(Pawn) }).to eq(true)
    end

    it 'places eight pawns on the seventh row' do
      expect(data[6].all? { |piece| piece.instance_of?(Pawn) }).to eq(true)
    end

    it 'places a rook on the first square of the eighth row' do
      expect(data[0][0].instance_of?(Rook)).to eq(true)
    end

    it 'places a knight on the second square of the eighth row' do
      expect(data[0][1].instance_of?(Knight)).to eq(true)
    end

    it 'places a bishop on the third square of the eighth row' do
      expect(data[0][2].instance_of?(Bishop)).to eq(true)
    end

    it 'places a queen on the fourth square of the eighth row' do
      expect(data[0][3].instance_of?(Queen)).to eq(true)
    end

    it 'places a king on the fifth square of the eighth row' do
      expect(data[0][4].instance_of?(King)).to eq(true)
    end

    it 'places a bishop on the sixth square of the eighth row' do
      expect(data[0][5].instance_of?(Bishop)).to eq(true)
    end

    it 'places a knight on the seventh square of the eighth row' do
      expect(data[0][6].instance_of?(Knight)).to eq(true)
    end

    it 'places a rook on the eighth square of the eighth row' do
      expect(data[0][7].instance_of?(Rook)).to eq(true)
    end
  end

  describe '#move' do
    let(:knight) { Knight.new(:black) }
    context 'when given a knight and a position' do
      it 'moves the knight to the exact position' do
        board.set
        end_position = [3, 3]
        board.move(knight, end_position)
        result_data = board.instance_variable_get(:@data)
        expect(result_data[end_position[0][end_position1]]).to eq(knight)
      end
    end

    context 'when given a knight and a different position' do
      xit 'moves the knight to the exact position' do
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
