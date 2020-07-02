# frozen_string_literal: true

RSpec.describe Codebreaker::UserStatistics do
  let(:user) { Codebreaker::User.new('John Doe') }
  let(:difficulty) { Codebreaker::Difficulty.new(name: 'Easy', attempts: 10, hints: 5) }
  let(:attempts) { 6 }
  let(:hints) { 1 }
  let(:invalid_user) { 'Jane Doe' }
  let(:invalid_difficulty) { 2 }
  let(:invalid_hints) { -1 }
  let(:invalid_attempts) { 0 }
  let(:expected_errors) do
    [Codebreaker::UnexpectedClassError,
     Codebreaker::NonPositiveIntegerError,
     Codebreaker::NegativeIntegerError]
  end

  it 'can be created by passing user, difficulty, attempts, hints to it' do
    expect { described_class.new(user: user, difficulty: difficulty, attempts: attempts, hints: hints) }
      .not_to raise_error
  end

  it 'can raise error if passed parameters are invalid' do
    expect do
      described_class.new(user: invalid_user, difficulty: invalid_difficulty,
                          attempts: invalid_attempts, hints: invalid_hints)
    end.to(raise_error { |error| expected_errors.include?(error.class) })
  end
end
