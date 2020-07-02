# frozen_string_literal: true

module Codebreaker
  class NonPositiveIntegerError < StandardError
    DEFAULT_MESSAGE = 'Integer was not positive'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
