# frozen_string_literal: true

RSpec.describe Codebreaker::CodeGenerator do
  describe '#generate' do
    context 'with default params' do
      subject(:generator) { described_class.new }

      let(:expected_range) { (1..6) }
      let(:expected_amount) { 4 }

      it 'can generate code numbers in default range: 1-6' do
        generated_code = generator.generate
        expect(expected_range.to_a).to include(*generated_code)
      end

      it 'can generate default numbers amount (4)' do
        generated_code = generator.generate
        expect(generated_code.count).to eq expected_amount
      end
    end

    context 'with custom params' do
      subject(:generator) { described_class.new(range: expected_range, amount: expected_amount) }

      let(:expected_range) { (0..9) }
      let(:expected_amount) { 10 }

      it 'can generate code numbers in custom range' do
        generated_code = generator.generate
        expect(expected_range.to_a).to include(*generated_code)
      end

      it 'can generate custom amount' do
        generated_code = generator.generate
        expect(generated_code.count).to eq expected_amount
      end
    end
  end
end
