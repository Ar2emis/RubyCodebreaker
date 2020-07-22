# frozen_string_literal: true

module Codebreaker
  class NonPositiveIntegerError < StandardError
    def initialize
      super(I18n.t(:non_positive_integer_error))
    end
  end
end
