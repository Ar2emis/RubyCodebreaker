# frozen_string_literal: true

module Codebreaker
  class GameFactory
    include Validator

    EASY = :easy
    MEDIUM = :medium
    HELL = :hell

    EASY_DIFFICULTY = Difficulty.new(name: 'Easy', attempts: 15, hints: 2).freeze
    MEDIUM_DIFFICULTY = Difficulty.new(name: 'Medium', attempts: 10, hints: 1).freeze
    HELL_DIFFICULTY = Difficulty.new(name: 'Hell', attempts: 5, hints: 1).freeze

    def create_game(user, difficulty_keyword)
      validate_data(user, difficulty_keyword)

      case difficulty_keyword
      when EASY then create_custom_game(user, EASY_DIFFICULTY)
      when MEDIUM then create_custom_game(user, MEDIUM_DIFFICULTY)
      when HELL then create_custom_game(user, HELL_DIFFICULTY)
      else raise UnknownDifficultyError
      end
    end

    private

    def create_custom_game(user, difficulty)
      Game.new(difficulty, user)
    end

    def validate_data(user, difficulty_keyword)
      validate_class(User, user)
      validate_class(Symbol, difficulty_keyword)
    end
  end
end
