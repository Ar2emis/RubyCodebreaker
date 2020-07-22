# frozen_string_literal: true

module Codebreaker
  class StringMaxLengthError < StandardError
    def initialize
      super(I18n.t(:string_max_length_error))
    end
  end
end
