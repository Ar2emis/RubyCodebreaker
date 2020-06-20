# frozen_string_literal: true

RSpec.describe Codebreaker::UserStatistics do
  it 'can be created by passing user, difficulty, attempts, hints to it' do
    user = Codebreaker::User.new('John Doe')
    difficulty = Codebreaker::Difficulty.new(name: 'Easy', attempts: 10, hints: 5)
    attempts = 6
    hints = 1

    user_statistics = Codebreaker::UserStatistics.new(user: user,
                                                      difficulty: difficulty,
                                                      attempts: attempts,
                                                      hints: hints)

    expect(user_statistics).to be
  end

  it 'can raise CodebreakerArgumentError if passed parameters are invalid' do
    expected_error_class = Codebreaker::CodebreakerArgumentError
    user = 1
    difficulty = 'hard'
    attempts = nil
    hints = 1.65

    expect do
      Codebreaker::UserStatistics.new(user: user,
                                      difficulty: difficulty,
                                      attempts: attempts,
                                      hints: hints)
    end.to raise_error(expected_error_class)
  end
end
