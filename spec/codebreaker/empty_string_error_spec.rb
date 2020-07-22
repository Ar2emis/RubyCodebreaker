# frozen_string_literal: true

RSpec.describe Codebreaker::EmptyStringError do
  describe 'creation' do
    subject(:error) { described_class.new }

    it 'creates with i18n message' do
      expect(error.message).to eq I18n.t(:empty_string_error)
    end
  end
end
