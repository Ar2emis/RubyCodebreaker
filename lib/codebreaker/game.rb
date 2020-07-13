# frozen_string_literal: true

module Codebreaker
  class Game
    include Validator
    attr_reader :difficulty, :user, :attempts_amount, :hints_amount, :code, :stage

    GAME_STAGE = :game
    END_STAGE = :end

    PLAY_STATUS = :play
    WIN_STATUS = :win
    LOSE_STATUS = :lose

    def initialize(difficulty, user)
      @difficulty = difficulty
      @user = user

      validate_data

      @store = CodebreakerStore.new
      prepare_game
    end

    def self.user_statistic
      store = CodebreakerStore.new
      store.data[:user_statistics].sort_by { |stat| [stat.difficulty, stat.attempts, stat.hints] }
    end

    def save_statistic
      raise InappropriateStageError unless stage == END_STAGE

      user_statisic = create_user_statistic
      @store.data[:user_statistics] << user_statisic
      @store.save
    end

    def take_hint
      raise NoHintsLeftError unless hints_amount.positive?
      raise InappropriateStageError if stage != GAME_STAGE

      @hints_amount -= 1
      @hints.pop
    end

    def make_turn(guess)
      raise InappropriateStageError if stage != GAME_STAGE

      @attempts_amount -= 1

      matcher = CodeMatcher.new(code, guess.code)
      match_result = matcher.match_codes

      if matcher.codes_match? then final_response(WIN_STATUS, match_result)
      elsif attempts_amount.positive? then response(PLAY_STATUS, match_result)
      else final_response(LOSE_STATUS, match_result)
      end
    end

    def restart
      prepare_game
    end

    private

    def create_user_statistic
      UserStatistics.new(user: user, difficulty: difficulty,
                         attempts: difficulty.attempts - attempts_amount,
                         hints: difficulty.hints - hints_amount)
    end

    def prepare_game
      @attempts_amount = difficulty.attempts
      @hints_amount = difficulty.hints
      @code = CodeGenerator.new.generate
      @hints = code.sample(hints_amount)
      @stage = GAME_STAGE
    end

    def response(status, match_result)
      { status: status, result: match_result }
    end

    def final_response(status, match_result)
      @stage = END_STAGE
      response(status, match_result)
    end

    def validate_data
      validate_class(Difficulty, difficulty)
      validate_class(User, user)
    end
  end
end
