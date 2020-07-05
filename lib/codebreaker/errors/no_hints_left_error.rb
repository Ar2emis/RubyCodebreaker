# frozen_string_literal: true

module Codebreaker
  class NoHintsLeftError < StandardError
    DEFAULT_MESSAGE = 'Attempt to get hint when no hints left'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
