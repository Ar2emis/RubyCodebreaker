# frozen_string_literal: true

module Codebreaker
  class NegativeIntegerError < StandardError
    def initialize
      super(I18n.t(:negative_integer_error))
    end
  end
end
