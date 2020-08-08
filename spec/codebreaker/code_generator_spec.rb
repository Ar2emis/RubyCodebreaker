# frozen_string_literal: true

RSpec.describe Codebreaker::CodeGenerator do
  subject(:generator) { described_class.new }

  describe '#valid?' do
    subject(:invalid_generator) { described_class.new(range: 1, amount: -1.65) }

    it 'returns true if instance is valid' do
      expect(generator).to be_valid
    end

    it 'returns false if instance is not valid' do
      expect(invalid_generator).not_to be_valid
    end
  end

  describe '#generate' do
    it 'can generate code numbers in some range (default: 1-6)' do
      expect(described_class::DEFAULT_CODE_RANGE).to cover(*generator.generate)
    end

    it 'can generate few numbers (default: 4)' do
      expect(generator.generate.length).to eq described_class::DEFAULT_CODE_LENGTH
    end
  end
end
