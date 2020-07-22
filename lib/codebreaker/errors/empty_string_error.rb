# frozen_string_literal: true

module Codebreaker
  class EmptyStringError < StandardError
    def initialize
      super(I18n.t(:empty_string_error))
    end
  end
end
