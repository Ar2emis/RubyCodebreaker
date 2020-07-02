# frozen_string_literal: true

module Codebreaker
  class UnexpectedClassError < StandardError
    DEFAULT_MESSAGE = 'Not expected class'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
