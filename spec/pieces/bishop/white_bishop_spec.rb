# frozen_string_literal: true

require_relative '../../../lib/pieces/bishop/white_bishop'

describe WhiteBishop do
  subject(:white_bishop) { described_class.new }

  describe '#file' do
    context 'when the white bishop is the only one created' do
      it 'returns 2' do
        expect(white_bishop.file).to eq(2)
      end
    end

    context 'when the white bishop is not the only one created' do
      it 'returns 5' do
        expect(white_bishop.file).to eq(5)
      end
    end
  end
end
