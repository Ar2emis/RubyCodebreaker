# frozen_string_literal: true

module Codebreaker
  class NegativeIntegerError < StandardError
    DEFAULT_MESSAGE = 'Integer was negative'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
