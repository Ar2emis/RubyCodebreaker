# frozen_string_literal: true

RSpec.describe Codebreaker::Difficulty do
  let(:name) { 'Easy' }
  let(:attempts) { 15 }
  let(:hints) { 2 }
  let(:invalid_name) { 1 }
  let(:invalid_attempts) { 0 }
  let(:invalid_hints) { -1 }
  let(:expected_errors) do
    [Codebreaker::UnexpectedClassError,
     Codebreaker::NonPositiveIntegerError,
     Codebreaker::NegativeIntegerError]
  end

  it 'can be created by passing name, attempts, hints to it' do
    expect { described_class.new(name: name, attempts: attempts, hints: hints) }.not_to raise_error
  end

  it 'can raise error if passed parameters are invalid' do
    expect { described_class.new(name: invalid_name, attempts: invalid_attempts, hints: invalid_hints) }
      .to(raise_error { |error| expected_errors.include?(error.class) })
  end
end
