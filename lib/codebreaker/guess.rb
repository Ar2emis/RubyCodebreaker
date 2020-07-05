# frozen_string_literal: true

module Codebreaker
  class Guess
    include Validator
    include GameConfiguration

    attr_reader :code

    def initialize(code)
      @code = code

      validate_data

      @code = parse_code
    end

    private

    def parse_code
      @code.chars.map { |number| Integer(number) }
    end

    def validate_data
      validate_code
    end

    def validate_code
      validate_class(String, @code)
      validate_string_length(string: @code, min_length: CODE_LENGTH, max_length: CODE_LENGTH)
      validate_only_numeric_string(@code)
    end
  end
end
