# frozen_string_literal: true

require_relative '../lib/validator'

describe Validator do
  subject(:validator) { described_class.new }
  describe '#valid_input?' do
    context 'when given a valid input' do
      context 'when given \'a8\'' do
        it 'returns true' do
          coordinate = 'a8'
          expect(validator.valid_input?(coordinate)).to eq(true)
        end
      end

      context 'when given \'a1\'' do
        it 'returns true' do
          coordinate = 'a1'
          expect(validator.valid_input?(coordinate)).to eq(true)
        end
      end

      context 'when given \'h7\'' do
        it 'returns true' do
          coordinate = 'h7'
          expect(validator.valid_input?(coordinate)).to eq(true)
        end
      end
    end

    context 'when given l4' do
      it 'returns false' do
        coordinate = 'l4'
        expect(validator.valid_input?(coordinate)).to eq(false)
      end
    end

    context 'when given aa' do
      it 'returns false' do
        coordinate = 'aa'
        expect(validator.valid_input?(coordinate)).to eq(false)
      end
    end

    context 'when given \'\'' do
      it 'returns false' do
        coordinate = ''
        expect(validator.valid_input?(coordinate)).to eq(false)
      end
    end

    context 'when given \'1a\'' do
      it 'returns false' do
        coordinate = '1a'
        expect(validator.valid_input?(coordinate)).to eq(false)
      end
    end
  end
end
