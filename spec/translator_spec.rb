# frozen_string_literal: true

require_relative '../lib/translator'

describe Translator do
  subject(:translator) { described_class.new }
  describe '#translate' do
    context 'when given \'a8\'' do
      it 'returns [0, 0]' do
        coordinate = 'a8'
        result = translator.translate(coordinate)
        expect(result).to eq([0, 0])
      end
    end

    context 'when given \'b8\'' do
      it 'returns [0, 1]' do
        coordinate = 'b8'
        result = translator.translate(coordinate)
        expect(result).to eq([0, 1])
      end
    end

    context 'when given \'a1\'' do
      it 'returns [7, 0]' do
        coordinate = 'a1'
        result = translator.translate(coordinate)
        expect(result).to eq([7, 0])
      end
    end

    context 'when given \'h6\'' do
      it 'returns [2, 7]' do
        coordinate = 'h6'
        result = translator.translate(coordinate)
        expect(result).to eq([2, 7])
      end
    end

    context 'when given \'h1\'' do
      it 'returns [7, 7]' do
        coordinate = 'h1'
        result = translator.translate(coordinate)
        expect(result).to eq([7, 7])
      end
    end

    context 'when given \'e4\'' do
      it 'returns  [4, 4]' do
        coordinate = 'e4'
        result = translator.translate(coordinate)
        expect(result).to eq([4, 4])
      end
    end
  end
end
