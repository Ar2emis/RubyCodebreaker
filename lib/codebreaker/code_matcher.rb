# frozen_string_literal: true

module Codebreaker
  class CodeMatcher
    include Validator
    include GameConfiguration

    attr_reader :answer

    def initialize(secret_code, guess_code)
      @secret_code = secret_code
      @guess_code = guess_code

      validate_data
    end

    def match_codes
      secret_code = @secret_code.clone
      guess_code = @guess_code.clone

      strong_match(secret_code, guess_code) + soft_match(secret_code, guess_code)
    end

    def codes_match?
      match_codes == STRONG_MATCH_SYMBOL * @secret_code.count
    end

    private

    def strong_match(secret_code, guess_code)
      guess_answer = ''

      guess_code.count.times do |index|
        next unless secret_code[index] == guess_code[index]

        guess_answer += STRONG_MATCH_SYMBOL
        secret_code[index] = nil
        guess_code[index] = nil
      end

      guess_answer
    end

    def soft_match(secret_code, guess_code)
      guess_answer = ''

      guess_code.count.times do |index|
        next unless guess_code[index] && secret_code.include?(guess_code[index])

        guess_answer += SOFT_MATCH_SYMBOL
        secret_code.delete_at(secret_code.index(guess_code[index]))
        guess_code[index] = nil
      end

      guess_answer
    end

    def validate_data
      [@secret_code, @guess_code].each { |code| validate_class(Array, code) }
    end
  end
end
