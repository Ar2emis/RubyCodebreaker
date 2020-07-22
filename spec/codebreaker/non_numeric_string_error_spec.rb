# frozen_string_literal: true

RSpec.describe Codebreaker::NonNumericStringError do
  describe 'creation' do
    subject(:error) { described_class.new }

    it 'creates with i18n message' do
      expect(error.message).to eq I18n.t(:non_numeric_string_error)
    end
  end
end
