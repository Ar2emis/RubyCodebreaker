# frozen_string_literal: true

module Codebreaker
  class UserStatistics
    include Validator
    attr_reader :user, :difficulty, :attempts, :hints

    def initialize(user:, difficulty:, attempts:, hints:)
      @user = user
      @difficulty = difficulty
      @attempts = attempts
      @hints = hints

      validate_data
    end

    private

    def validate_data
      validate_user
      validate_difficulty
      validate_attempts
      validate_hints
    end

    def validate_user
      validate_class(Codebreaker::User, @user)
    end

    def validate_difficulty
      validate_class(Codebreaker::Difficulty, @difficulty)
    end

    def validate_attempts
      validate_class(Integer, @attempts)
      validate_positive_integer(@attempts)
    end

    def validate_hints
      validate_class(Integer, @hints)
      validate_non_negative_integer(@hints)
    end
  end
end
