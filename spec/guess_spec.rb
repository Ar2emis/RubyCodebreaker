# frozen_string_literal: true

RSpec.describe Codebreaker::Guess do
  it 'can be created by passing string code to it' do
    code = '1234'
    guess = Codebreaker::Guess.new(code)

    expect(guess).to be
  end

  it 'can raise CodebreakerArgumentError if passed parameters are invalid' do
    expected_error_class = Codebreaker::CodebreakerArgumentError
    code = ''

    expect { Codebreaker::Guess.new(code) }.to raise_error(expected_error_class)
  end
end
