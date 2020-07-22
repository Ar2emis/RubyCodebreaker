# frozen_string_literal: true

module Codebreaker
  class StringMinLengthError < StandardError
    def initialize
      super(I18n.t(:string_min_length_error))
    end
  end
end
