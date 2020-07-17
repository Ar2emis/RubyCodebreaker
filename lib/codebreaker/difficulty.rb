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

    def <=>(other)
      [attempts, hints] <=> [other.attempts, other.hints]
    end

    def self.difficulty(keyword)
      case keyword
      when :easy then Difficulty.new(name: 'Easy', attempts: 15, hints: 2)
      when :medium then Difficulty.new(name: 'Medium', attempts: 10, hints: 1)
      when :hell then Difficulty.new(name: 'Hell', attempts: 5, hints: 1)
      else
        raise UnknownDifficultyError
      end
    end

    private

    def validate_data
      validate_name
      validate_attempts
      validate_hints
    end

    def validate_name
      validate_class(String, name)
      validate_non_empty_string(name)
    end

    def validate_attempts
      validate_class(Integer, attempts)
      validate_positive_integer(attempts)
    end

    def validate_hints
      validate_class(Integer, hints)
      validate_non_negative_integer(hints)
    end
  end
end
