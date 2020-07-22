# frozen_string_literal: true

module Codebreaker
  class ValidatableEntity
    include Validator

    attr_reader :errors

    def initialize
      @errors = {}
    end

    def valid?
      validate
      errors.empty?
    end

    private

    def validate; end

    def add_error(attribute, error)
      @errors[attribute] = @errors[attribute].nil? ? [error] : @errors[attribute] << error
    end
  end
end
