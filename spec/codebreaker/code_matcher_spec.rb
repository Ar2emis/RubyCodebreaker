# frozen_string_literal: true

RSpec.describe Codebreaker::CodeMatcher do
  describe '#match_codes' do
    test_examples = [{ code: [6, 5, 4, 3], guess: [5, 6, 4, 3], answer: '++--' },
                     { code: [6, 5, 4, 3], guess: [6, 4, 1, 1], answer: '+-' },
                     { code: [6, 5, 4, 3], guess: [6, 5, 4, 4], answer: '+++' },
                     { code: [6, 5, 4, 3], guess: [3, 4, 5, 6], answer: '----' },
                     { code: [6, 5, 4, 3], guess: [6, 6, 6, 6], answer: '+' },
                     { code: [6, 5, 4, 3], guess: [2, 6, 6, 6], answer: '-' },
                     { code: [6, 5, 4, 3], guess: [2, 2, 2, 2], answer: '' },
                     { code: [6, 6, 6, 6], guess: [1, 6, 6, 1], answer: '++' },
                     { code: [1, 2, 3, 4], guess: [3, 1, 2, 4], answer: '+---' },
                     { code: [1, 2, 3, 4], guess: [1, 5, 2, 4], answer: '++-' },
                     { code: [1, 2, 3, 4], guess: [1, 2, 3, 4], answer: '++++' }]

    test_examples.each do |test_example|
      secret_code = test_example[:code]
      guess = test_example[:guess]
      expected_match = test_example[:answer]

      it "returns '#{expected_match}' when code: #{secret_code} and guess: #{guess}" do
        matcher = described_class.new(secret_code, guess)
        expect(matcher.match_codes).to eq expected_match
      end
    end
  end

  describe '#codes_match?' do
    let(:code) { [1, 2, 3, 4] }
    let(:guess) { [1, 2, 3, 4] }
    let(:wrong_guess) { [1, 2, 3, 1] }

    it 'returns true if codes exactly match (++++)' do
      matcher = described_class.new(code, guess)
      expect(matcher).to be_codes_match
    end

    it 'returns false if codes do not exactly match' do
      matcher = described_class.new(code, wrong_guess)
      expect(matcher).not_to be_codes_match
    end
  end
end
