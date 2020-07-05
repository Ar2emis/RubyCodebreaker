# frozen_string_literal: true

RSpec.describe Codebreaker::CodeGenerator do
  describe '#generate' do
    subject(:generator) { described_class.new(range: expected_range, amount: expected_amount) }

    let(:expected_range) { (0..9) }
    let(:expected_amount) { 10 }
    let(:code) { generator.generate }

    it 'can generate code numbers in some range (default: 1-6)' do
      expect(expected_range.to_a).to include(*code)
    end

    it 'can generate few numbers (default: 4)' do
      expect(code.count).to eq expected_amount
    end
  end
end
