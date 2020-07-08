# frozen_string_literal: true

RSpec.describe Codebreaker::Game do
  subject(:game) { described_class.new(difficulty, user) }

  let(:difficulty) { Codebreaker::Difficulty.new(name: 'Easy', attempts: 10, hints: 2) }
  let(:user) { Codebreaker::User.new('John Doe') }
  let(:stage_variable) { :@stage }
  let(:game_stage) { :game }
  let(:end_stage) { :end }

  before do
    store = instance_double(Codebreaker::CodebreakerStore)
    allow(store).to receive(:data).and_return({ user_statistics: [] })
    allow(store).to receive(:save)
    allow(Codebreaker::CodebreakerStore).to receive(:new).and_return(store)
  end

  describe '#restart' do
    it 'changes code' do
      old_code = game.code
      game.restart
      expect(game.code).not_to eq old_code
    end

    it 'restore attempts' do
      game.restart
      expect(game.attempts).to eq difficulty.attempts
    end

    it 'restore hints' do
      game.restart
      expect(game.hints).to eq difficulty.hints
    end
  end

  context 'with user statistics' do
    describe '#save_statistic' do
      let(:expected_error) { Codebreaker::InappropriateStageError }

      it 'can save user statistic after game end' do
        game.instance_variable_set(stage_variable, end_stage)
        expect { game.save_statistic }.not_to raise_error
      end

      it 'can raise error if try to save statistic before or in game' do
        game.instance_variable_set(stage_variable, game_stage)
        expect { game.save_statistic }.to raise_error(expected_error)
      end
    end

    describe '#user_statistic' do
      it 'returns game statistic' do
        expect(game.user_statistic).to be_an Array
      end
    end
  end

  describe '#take_hint' do
    let(:hints_variable) { :@hints }
    let(:expected_no_hints_error) { Codebreaker::NoHintsLeftError }
    let(:expected_stage_error) { Codebreaker::InappropriateStageError }

    it 'can return one of the code numbers' do
      expect(game.code).to include(game.take_hint)
    end

    it 'can raise error if no hints left' do
      game.instance_variable_set(hints_variable, 0)
      expect { game.take_hint }.to raise_error(expected_no_hints_error)
    end

    it 'can raise error if method is called when game ended' do
      game.instance_variable_set(stage_variable, end_stage)
      expect { game.take_hint }.to raise_error(expected_stage_error)
    end
  end

  describe '#make_turn' do
    let(:guess) { Codebreaker::Guess.new('1234') }
    let(:expected_error) { Codebreaker::InappropriateStageError }

    context 'when game goes' do
      let(:play_status) { described_class::PLAY_STATUS }
      let(:win_status) { described_class::WIN_STATUS }
      let(:lose_status) { described_class::LOSE_STATUS }
      let(:attempts_variable) { :@attempts }

      it 'returns playing status and action result when game continues' do
        expect(game.make_turn(guess)[:status]).to eq play_status
      end

      it 'returns winning status and action result when player wins' do
        win_guess = Codebreaker::Guess.new(game.code.map(&:to_s).join)
        expect(game.make_turn(win_guess)[:status]).to eq win_status
      end

      it 'returns losing status and action result when player loses' do
        game.instance_variable_set(attempts_variable, 1)
        expect(game.make_turn(guess)[:status]).to eq lose_status
      end
    end

    it 'can raise error if method is called when game ended' do
      game.instance_variable_set(stage_variable, end_stage)
      expect { game.make_turn(guess) }.to raise_error(expected_error)
    end
  end
end
