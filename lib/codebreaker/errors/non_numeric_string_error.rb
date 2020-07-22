# frozen_string_literal: true

module Codebreaker
  class NonNumericStringError < StandardError
    def initialize
      super(I18n.t(:non_numeric_string_error))
    end
  end
end
