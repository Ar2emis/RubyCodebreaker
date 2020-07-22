# frozen_string_literal: true

RSpec.describe Codebreaker::StringMinLengthError do
  describe 'creation' do
    subject(:error) { described_class.new }

    it 'creates with i18n message' do
      expect(error.message).to eq I18n.t(:string_min_length_error)
    end
  end
end
