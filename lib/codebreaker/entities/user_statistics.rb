# frozen_string_literal: true

module Codebreaker
  class UserStatistics < ValidatableEntity
    include Validator
    attr_reader :user, :difficulty, :attempts, :hints

    def initialize(user:, difficulty:, attempts:, hints:)
      super()
      @user = user
      @difficulty = difficulty
      @attempts = attempts
      @hints = hints
    end

    private

    def validate
      add_error(:user, UnexpectedClassError) unless valid_class?(User, user)
      add_error(:difficulty, UnexpectedClassError) unless valid_class?(Difficulty, difficulty)
      validate_attempts
      validate_hints
    end

    def validate_attempts
      return add_error(:attempts, UnexpectedClassError) unless valid_class?(Integer, attempts)

      add_error(:attempts, NegativeIntegerError) unless valid_non_negative_integer?(attempts)
    end

    def validate_hints
      return add_error(:hints, UnexpectedClassError) unless valid_class?(Integer, hints)

      add_error(:hints, NegativeIntegerError) unless valid_non_negative_integer?(hints)
    end
  end
end
