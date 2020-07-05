# frozen_string_literal: true

module GameConfiguration
  CODE_RANGE = (1..6).freeze
  CODE_LENGTH = 4

  STRONG_MATCH_SYMBOL = '+'
  SOFT_MATCH_SYMBOL = '-'

  USERNAME_MIN_LENGTH = 3
  USERNAME_MAX_LENGTH = 20

  EASY_DIFFICULTY_CONFIG = { name: 'Easy', attempts: 15, hints: 2 }.freeze
  MEDIUM_DIFFICULTY_CONFIG = { name: 'Medium', attempts: 10, hints: 1 }.freeze
  HELL_DIFFICULTY_CONFIG = { name: 'Hell', attempts: 5, hints: 1 }.freeze
end
