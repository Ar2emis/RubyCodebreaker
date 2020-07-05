# frozen_string_literal: true

RSpec.describe Codebreaker::Guess do
  let(:code) { '1234' }

  it 'can be created by passing string code to it' do
    expect { described_class.new(code) }.not_to raise_error
  end
end
