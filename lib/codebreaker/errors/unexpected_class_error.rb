# frozen_string_literal: true

module Codebreaker
  class UnexpectedClassError < StandardError
    def initialize
      super(I18n.t(:unexpected_class_error))
    end
  end
end
