# frozen_string_literal: true

RSpec.describe Codebreaker::UserStatistics do
  let(:user) { Codebreaker::User.new(Faker::Name.first_name) }
  let(:difficulty) { Codebreaker::Difficulty.new(name: 'Easy', attempts: 10, hints: 5) }
  let(:attempts) { 6 }
  let(:hints) { 1 }

  it 'can be created by passing user, difficulty, attempts, hints to it' do
    expect { described_class.new(user: user, difficulty: difficulty, attempts: attempts, hints: hints) }
      .not_to raise_error
  end
end
