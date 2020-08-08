# frozen_string_literal: true

RSpec.describe Codebreaker::Guess do
  subject(:guess) { described_class.new(string_code) }

  let(:string_code) { '1234' }
  let(:parsed_code) { [1, 2, 3, 4] }

  describe '#valid?' do
    let(:non_string) { 1 }
    let(:invalid_code) { 'a' * described_class::CODE_LENGTH }
    let(:too_short_code) { '1' * (described_class::CODE_LENGTH - 1) }
    let(:too_long_code) { '1' * (described_class::CODE_LENGTH + 1) }

    it 'returns true if instance is valid' do
      expect(guess).to be_valid
    end

    it 'returns false if passed not a string' do
      invalid_guess = described_class.new(non_string)
      expect(invalid_guess).not_to be_valid
    end

    it 'returns false if passed string is not numeric' do
      invalid_guess = described_class.new(invalid_code)
      expect(invalid_guess).not_to be_valid
    end

    it 'returns false if passed string code is too short' do
      invalid_guess = described_class.new(too_short_code)
      expect(invalid_guess).not_to be_valid
    end

    it 'returns false if passed string code is too long' do
      invalid_guess = described_class.new(too_long_code)
      expect(invalid_guess).not_to be_valid
    end
  end

  describe '#code' do
    it 'returns parsed code' do
      expect(guess.code).to eq parsed_code
    end
  end
end
