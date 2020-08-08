# frozen_string_literal: true

module Codebreaker
  class Guess < ValidatableEntity
    CODE_LENGTH = 4

    def initialize(string_code)
      super()
      @string_code = string_code
    end

    def code
      @code ||= parse_code
    end

    private

    def parse_code
      @string_code.chars.map { |number| Integer(number) }
    end

    def validate
      return add_error(:code, I18n.t(:unexpected_class_error)) unless valid_class?(String, @string_code)

      validate_code_length
      return add_error(:code, I18n.t(:non_numeric_string_error)) unless valid_only_numeric_string?(@string_code)

      add_error(:code, I18n.t(:invalid_range)) unless valid_range?(CodeGenerator::DEFAULT_CODE_RANGE, parse_code)
    end

    def validate_code_length
      add_error(:code, I18n.t(:string_min_length_error)) unless valid_string_min_length?(@string_code, CODE_LENGTH)
      add_error(:code, I18n.t(:string_max_length_error)) unless valid_string_max_length?(@string_code, CODE_LENGTH)
    end
  end
end
