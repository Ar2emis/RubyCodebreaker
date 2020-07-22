# frozen_string_literal: true

module Codebreaker
  class NoHintsLeftError < StandardError
    def initialize
      super(I18n.t(:no_hints_left_error))
    end
  end
end
