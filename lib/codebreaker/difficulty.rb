# frozen_string_literal: true

module Codebreaker
  class Difficulty
    include Validator
    attr_reader :name, :attempts, :hints

    def initialize(name:, attempts:, hints:)
      @name = name
      @attempts = attempts
      @hints = hints

      validate_data
    end

    private

    def validate_data
      validate_name
      validate_attempts
      validate_hints
    end

    def validate_name
      validate_class(String, @name.class)
      validate_non_empty_string(@name)
    end

    def validate_attempts
      validate_class(Integer, @attempts.class)
      validate_positive_integer(@attempts)
    end

    def validate_hints
      validate_class(Integer, @hints.class)
      validate_non_negative_integer(@hints)
    end
  end
end
