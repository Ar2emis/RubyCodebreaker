# frozen_string_literal: true

module Codebreaker
  class CodeGenerator
    include Validator

    DEFAULT_CODE_RANGE = (1..6).freeze
    DEFAULT_CODE_LENGTH = 4

    def initialize(range: DEFAULT_CODE_RANGE, amount: DEFAULT_CODE_LENGTH)
      @range = range
      @amount = amount

      validate_data
    end

    def generate
      random = Random.new
      @amount.times.map { random.rand(@range) }
    end

    private

    def validate_data
      validate_range
      validate_amount
    end

    def validate_range
      validate_class(Range, @range)
    end

    def validate_amount
      validate_class(Integer, @amount)
      validate_positive_integer(@amount)
    end
  end
end
