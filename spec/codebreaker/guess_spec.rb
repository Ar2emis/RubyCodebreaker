# frozen_string_literal: true

RSpec.describe Codebreaker::Guess do
  let(:code) { '1234' }
  let(:invalid_code) { 'avc`123' }
  let(:expected_errors) do
    [Codebreaker::UnexpectedClassError,
     Codebreaker::InvalidStringLengthError,
     Codebreaker::NonNumericStringError]
  end

  it 'can be created by passing string code to it' do
    expect { described_class.new(code) }.not_to raise_error
  end

  it 'can raise error if passed parameter is invalid' do
    expect { described_class.new(invalid_code) }.to(raise_error { |error| expected_errors.include?(error.class) })
  end
end
