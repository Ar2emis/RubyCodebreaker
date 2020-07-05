# frozen_string_literal: true

module Codebreaker
  class UnknownDifficultyError < StandardError
    DEFAULT_MESSAGE = 'Unknown difficulty keyword has been passed to game factory'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
