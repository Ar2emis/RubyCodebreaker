# frozen_string_literal: true

module Codebreaker
  class Difficulty < ValidatableEntity
    attr_reader :name, :attempts, :hints

    def initialize(name:, attempts:, hints:)
      super()
      @name = name
      @attempts = attempts
      @hints = hints
    end

    def <=>(other)
      [attempts, hints] <=> [other.attempts, other.hints]
    end

    def self.difficulties(keyword)
      case keyword
      when :easy then Difficulty.new(name: 'Easy', attempts: 15, hints: 2)
      when :medium then Difficulty.new(name: 'Medium', attempts: 10, hints: 1)
      when :hell then Difficulty.new(name: 'Hell', attempts: 5, hints: 1)
      else
        raise UnknownDifficultyError
      end
    end

    private

    def validate
      validate_name
      validate_attempts
      validate_hints
    end

    def validate_name
      add_error(:name, UnexpectedClassError) unless valid_class?(String, name)
      add_error(:name, EmptyStringError) if valid_class?(String, name) && !valid_non_empty_string?(name)
    end

    def validate_attempts
      add_error(:attempts, UnexpectedClassError) unless valid_class?(Integer, attempts)
      add_error(:attempts, NonPositiveIntegerError) if valid_class?(Integer, attempts) &&
                                                       !valid_positive_integer?(attempts)
    end

    def validate_hints
      add_error(:hints, UnexpectedClassError) unless valid_class?(Integer, hints)
      add_error(:hints, NegativeIntegerError) if valid_class?(Integer, hints) && !valid_non_negative_integer?(hints)
    end
  end
end
