# frozen_string_literal: true

module Codebreaker
  class UserStatisticsStore
    STORAGE_DIRECTORY = 'db'
    STORAGE_FILE = 'user_statistics.yml'
    attr_accessor :data

    def initialize
      @data = db_initialized? ? load : initialize_db
    end

    def save
      store = YAML::Store.new(storage_path)

      store.transaction { @data.each { |key, value| store[key] = value } }
    end

    private

    def db_initialized?
      Dir.exist?(STORAGE_DIRECTORY)
    end

    def initialize_db
      Dir.mkdir(STORAGE_DIRECTORY)

      default_data
    end

    def default_data
      {
        user_statistics: []
      }
    end

    def storage_path
      File.join(STORAGE_DIRECTORY, STORAGE_FILE)
    end

    def load
      store = YAML::Store.new(storage_path)

      store.transaction { store.roots.to_h { |key| [key, store[key]] } }
    end
  end
end
