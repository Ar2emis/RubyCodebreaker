# frozen_string_literal: true

module Codebreaker
  class NonNumericStringError < StandardError
    DEFAULT_MESSAGE = 'String did not match numeric regex'

    def initialize(message = DEFAULT_MESSAGE)
      super
    end
  end
end
