# frozen_string_literal: true

RSpec.describe Codebreaker::Difficulty do
  it 'can be created by passing name, attempts, hints to it' do
    difficulty = Codebreaker::Difficulty.new(name: 'Easy', attempts: 15, hints: 2)

    expect(difficulty).to be
  end

  it 'can raise CodebreakerArgumentError if passed parameters are invalid' do
    expected_error_class = Codebreaker::CodebreakerArgumentError
    expect { Codebreaker::Difficulty.new(name: 1, attempts: nil, hints: false) }.to raise_error(expected_error_class)
  end
end
