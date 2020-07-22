# frozen_string_literal: true

module Codebreaker
  class Guess < ValidatableEntity
    CODE_LENGTH = 4

    def initialize(string_code)
      super()
      @string_code = string_code
    end

    def code
      @code ||= @string_code.chars.map { |number| Integer(number) }
    end

    private

    def validate
      return add_error(:code, UnexpectedClassError) unless valid_class?(String, @string_code)

      add_error(:code, StringMinLengthError) unless valid_string_min_length?(@string_code, CODE_LENGTH)
      add_error(:code, StringMaxLengthError) unless valid_string_max_length?(@string_code, CODE_LENGTH)
      add_error(:code, NonNumericStringError) unless valid_only_numeric_string?(@string_code)
    end
  end
end
