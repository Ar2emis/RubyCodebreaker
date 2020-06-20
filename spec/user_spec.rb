# frozen_string_literal: true

RSpec.describe Codebreaker::User do
  it 'can be created by passing name to it' do
    name = 'John Doe'
    user = Codebreaker::User.new(name)

    expect(user).to be
  end

  it 'can raise CodebreakerArgumentError if passed parameters are invalid' do
    expected_error_class = Codebreaker::CodebreakerArgumentError
    name = ''

    expect { Codebreaker::User.new(name) }.to raise_error(expected_error_class)
  end
end
