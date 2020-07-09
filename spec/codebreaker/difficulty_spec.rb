# frozen_string_literal: true

RSpec.describe Codebreaker::Difficulty do
  subject(:difficulty) { described_class.new(name: 'Medium', attempts: 10, hints: 2) }

  let(:equal_difficulty) { described_class.new(name: 'Normal', attempts: 10, hints: 2) }
  let(:easy_difficulty) { described_class.new(name: 'Easy', attempts: 15, hints: 3) }
  let(:hell_difficulty) { described_class.new(name: 'Hell', attempts: 5, hints: 1) }

  describe '#<=>' do
    it 'is harder when fewer attempts and hints' do
      expect(difficulty <=> easy_difficulty).to eq(-1)
    end

    it 'is easier when more attempts and hints' do
      expect(difficulty <=> hell_difficulty).to eq 1
    end

    it 'is equal another difficulty when has same amount of attempts and hints' do
      expect(difficulty <=> equal_difficulty).to eq 0
    end
  end
end
