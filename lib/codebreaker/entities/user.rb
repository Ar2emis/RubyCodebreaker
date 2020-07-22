# frozen_string_literal: true

module Codebreaker
  class User < ValidatableEntity
    attr_reader :name

    USERNAME_MIN_LENGTH = 3
    USERNAME_MAX_LENGTH = 20

    def initialize(name)
      super()
      @name = name
    end

    private

    def validate
      return add_error(:name, UnexpectedClassError) unless valid_class?(String, name)

      add_error(:name, StringMinLengthError) unless valid_string_min_length?(name, USERNAME_MIN_LENGTH)
      add_error(:name, StringMaxLengthError) unless valid_string_max_length?(name, USERNAME_MAX_LENGTH)
    end
  end
end
