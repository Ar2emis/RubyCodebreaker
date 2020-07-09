# frozen_string_literal: true

module Codebreaker
  module Validator
    def validate_class(expected_class, instance)
      raise UnexpectedClassError unless instance.is_a?(expected_class)
    end

    def validate_class_or_nil(expected_class, instance)
      raise UnexpectedClassError unless [expected_class, NilClass].include?(instance.class)
    end

    def validate_non_empty_string(string)
      raise EmptyStringError if string.empty?
    end

    def validate_positive_integer(number)
      raise NonPositiveIntegerError unless number.positive?
    end

    def validate_non_negative_integer(number)
      raise NegativeIntegerError if number.negative?
    end

    def validate_string_length(string:, min_length:, max_length: nil)
      if max_length.nil?
        raise InvalidStringLengthError if string.length < min_length
      elsif string.length < min_length || string.length > max_length
        raise InvalidStringLengthError
      end
    end

    def validate_only_numeric_string(string)
      raise NonNumericStringError unless /\A\d+\Z/.match?(string)
    end
  end
end
