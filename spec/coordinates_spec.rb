# frozen_string_literal: true

require_relative '../lib/coordinates'

describe Coordinates do
  subject(:coordinates) { described_class.new(input) }
  describe '#convert' do
    context 'when coordinates are \'a8\'' do
      let(:input) { 'a8' }
      it 'returns [0, 0]' do
        expect(coordinates.convert).to eq([0, 0])
      end
    end

    context 'when coordinates are \'b8\'' do
      let(:input) { 'b8' }
      it 'returns [0, 1]' do
        expect(coordinates.convert).to eq([0, 1])
      end
    end

    context 'when coordinates are \'a1\'' do
      let(:input) { 'a1' }
      it 'returns [7, 0]' do
        expect(coordinates.convert).to eq([7, 0])
      end
    end

    context 'when coordinates are \'h6\'' do
      let(:input) { 'h6' }
      it 'returns [2, 7]' do
        expect(coordinates.convert).to eq([2, 7])
      end
    end

    context 'when coordinates are \'h1\'' do
      let(:input) { 'h1' }
      it 'returns [7, 7]' do
        expect(coordinates.convert).to eq([7, 7])
      end
    end

    context 'when given \'e4\'' do
      let(:input) { 'e4' }
      it 'returns  [4, 4]' do
        expect(coordinates.convert).to eq([4, 4])
      end
    end
  end
end
