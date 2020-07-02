# frozen_string_literal: true

RSpec.describe Codebreaker::User do
  let(:name) { 'John Doe' }
  let(:invalid_name) { '' }
  let(:expected_errors) do
    [Codebreaker::UnexpectedClassError,
     Codebreaker::InvalidStringLengthError]
  end

  it 'can be created by passing name to it' do
    expect { described_class.new(name) }.not_to raise_error
  end

  it 'can raise CodebreakerArgumentError if passed parameters are invalid' do
    expect { described_class.new(invalid_name) }.to(raise_error { |error| expected_errors.include?(error.class) })
  end
end
