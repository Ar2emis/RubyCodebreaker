# frozen_string_literal: true

module Codebreaker
  class InappropriateStageError < StandardError
    DEFAULT_MESSAGE = 'Action has been made at inappropriate stage'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
