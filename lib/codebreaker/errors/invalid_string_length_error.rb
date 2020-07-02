# frozen_string_literal: true

module Codebreaker
  class InvalidStringLengthError < StandardError
    DEFAULT_MESSAGE = 'String length was out of range'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
