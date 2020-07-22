# frozen_string_literal: true

module Codebreaker
  module Validator
    def valid_class?(expected_class, instance)
      instance.is_a?(expected_class)
    end

    def valid_non_empty_string?(string)
      !string.empty?
    end

    def valid_positive_integer?(number)
      number.positive?
    end

    def valid_non_negative_integer?(number)
      !number.negative?
    end

    def valid_string_min_length?(string, min_length)
      string.length >= min_length
    end

    def valid_string_max_length?(string, max_length)
      string.length <= max_length
    end

    def valid_only_numeric_string?(string)
      /\A\d+\Z/.match?(string)
    end
  end
end
