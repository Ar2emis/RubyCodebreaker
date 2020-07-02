# frozen_string_literal: true

module Codebreaker
  class EmptyStringError < StandardError
    DEFAULT_MESSAGE = 'String was empty'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
