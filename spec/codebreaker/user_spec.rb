# frozen_string_literal: true

RSpec.describe Codebreaker::User do
  let(:name) { Faker::Name.first_name }

  it 'can be created by passing name to it' do
    expect { described_class.new(name) }.not_to raise_error
  end
end
