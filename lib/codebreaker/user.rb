# frozen_string_literal: true

module Codebreaker
  class User
    include Validator
    attr_reader :name

    def initialize(name)
      @name = name

      validate_data
    end

    private

    def validate_data
      validate_name
    end

    def validate_name
      min_length = 3
      max_length = 20

      validate_class(String, @name)
      validate_string_length(string: @name, min_length: min_length, max_length: max_length)
    end
  end
end
