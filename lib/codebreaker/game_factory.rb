# frozen_string_literal: true

module Codebreaker
  class GameFactory
    include Validator
    include GameConfiguration

    EASY = :easy_difficulty
    MEDIUM = :medium_difficulty
    HELL = :hell_difficulty

    EASY_DIFFICULTY = Difficulty.new(name: EASY_DIFFICULTY_CONFIG[:name],
                                     attempts: EASY_DIFFICULTY_CONFIG[:attempts],
                                     hints: EASY_DIFFICULTY_CONFIG[:hints]).freeze
    MEDIUM_DIFFICULTY = Difficulty.new(name: MEDIUM_DIFFICULTY_CONFIG[:name],
                                       attempts: MEDIUM_DIFFICULTY_CONFIG[:attempts],
                                       hints: MEDIUM_DIFFICULTY_CONFIG[:hints]).freeze
    HELL_DIFFICULTY = Difficulty.new(name: HELL_DIFFICULTY_CONFIG[:name],
                                     attempts: HELL_DIFFICULTY_CONFIG[:attempts],
                                     hints: HELL_DIFFICULTY_CONFIG[:hints]).freeze

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
