# frozen_string_literal: true

module Codebreaker
  class UnknownDifficultyError < StandardError
    def initialize
      super(I18n.t(:unknown_difficulty_error))
    end
  end
end
