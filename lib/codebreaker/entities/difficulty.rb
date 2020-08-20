# frozen_string_literal: true

module Codebreaker
  class Difficulty < ValidatableEntity
    attr_reader :name, :attempts, :hints

    EASY = :easy
    MEDIUM = :medium
    HELL = :hell

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
      when EASY then Difficulty.new(name: 'Easy', attempts: 15, hints: 2)
      when MEDIUM then Difficulty.new(name: 'Medium', attempts: 10, hints: 1)
      when HELL then Difficulty.new(name: 'Hell', attempts: 5, hints: 1)
      end
    end

    private

    def validate
      validate_name
      validate_attempts
      validate_hints
    end

    def validate_name
      return add_error(:name, I18n.t(:unexpected_class_error)) unless valid_class?(String, name)

      add_error(:name, I18n.t(:empty_string_error)) unless valid_non_empty_string?(name)
    end

    def validate_attempts
      return add_error(:attempts, I18n.t(:unexpected_class_error)) unless valid_class?(Integer, attempts)

      add_error(:attempts, I18n.t(:non_positive_integer_error)) unless valid_positive_integer?(attempts)
    end

    def validate_hints
      return add_error(:hints, I18n.t(:unexpected_class_error)) unless valid_class?(Integer, hints)

      add_error(:hints, I18n.t(:negative_integer_error)) unless valid_non_negative_integer?(hints)
    end
  end
end
