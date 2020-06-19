# frozen_string_literal: true

module Codebreaker
  class CodeGenerator
    include Validator

    def initialize(range: (1..6), amount: 4)
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
      validate_class(Range, @range.class)
    end

    def validate_amount
      validate_class(Integer, @amount.class)
      validate_positive_integer(@amount)
    end
  end
end
