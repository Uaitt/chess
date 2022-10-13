# frozen_string_literal: true

require_relative '../lib/translator'

describe Translator do
  subject(:translator) { described_class.new }
  describe '#translate' do
    context 'when given \'a8\'' do
      it 'returns [0, 0]' do
        input = 'a8'
        result = translator.translate(input)
        expect(result).to eq([0, 0])
      end
    end
  end
end
