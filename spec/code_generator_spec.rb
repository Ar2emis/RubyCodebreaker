# frozen_string_literal: true

RSpec.describe Codebreaker::CodeGenerator do
  context '#generate' do
    it 'can generate code (4 numbers) in range: 1-6' do
      expected_range = (1..6)
      expected_amount = 4
      generator = Codebreaker::CodeGenerator.new
      generated_code = generator.generate

      expect(expected_range.to_a).to include(*generated_code)
      expect(generated_code.count).to eq expected_amount
    end

    it 'can generate code (custom numbers amount) in custom range' do
      expected_range = (7..9)
      expected_amount = 6
      generator = Codebreaker::CodeGenerator.new(range: expected_range, amount: expected_amount)
      generated_code = generator.generate

      expect(expected_range.to_a).to include(*generated_code)
      expect(generated_code.count).to eq expected_amount
    end
  end
end
