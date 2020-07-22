# frozen_string_literal: true

module Codebreaker
  class CodeGenerator < ValidatableEntity
    DEFAULT_CODE_RANGE = (1..6).freeze
    DEFAULT_CODE_LENGTH = 4

    def initialize(range: DEFAULT_CODE_RANGE, amount: DEFAULT_CODE_LENGTH)
      super()
      @range = range
      @amount = amount
    end

    def generate
      Array.new(@amount) { rand(@range) }
    end

    private

    def validate
      add_error(:range, UnexpectedClassError) unless valid_class?(Range, @range)
      return add_error(:amount, UnexpectedClassError) unless valid_class?(Integer, @amount)

      add_error(:amount, NonPositiveIntegerError) unless valid_positive_integer?(@amount)
    end
  end
end
