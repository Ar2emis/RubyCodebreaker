# frozen_string_literal: true

RSpec.describe Codebreaker::GameFactory do
  describe '#create_game' do
    subject(:factory) { described_class.new }

    let(:user) { Codebreaker::User.new('John Doe') }

    before do
      store = instance_double(Codebreaker::CodebreakerStore)
      allow(Codebreaker::CodebreakerStore).to receive(:new).and_return(store)
    end

    it 'returns game with easy difficulty' do
      game = factory.create_game(user, described_class::EASY)
      expect(game.difficulty).to eq described_class::EASY_DIFFICULTY
    end

    it 'returns game with medium difficulty' do
      game = factory.create_game(user, described_class::MEDIUM)
      expect(game.difficulty).to eq described_class::MEDIUM_DIFFICULTY
    end

    it 'returns game with hell difficulty' do
      game = factory.create_game(user, described_class::HELL)
      expect(game.difficulty).to eq described_class::HELL_DIFFICULTY
    end

    it 'raises error if unknown difficulty keyword passed' do
      expect { factory.create_game(user, :unknown_keyword) }.to raise_error(Codebreaker::UnknownDifficultyError)
    end
  end
end
