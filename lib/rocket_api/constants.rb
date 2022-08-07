require "rocket_api/validation"
module RocketApi
  # Valid input
  CHECK_APPS = %w[*.gemspec *.ru README.md].freeze

  # Valid commands
  COMMANDS = { init: "init", gem: "gem", rack: "rack", bot: "bot" }.freeze

  # Gem
  GEM_DIRS = %w[bin lib test].freeze
  GEM_FILES = %w[bin! gemspec! gems_main_file! gems_version! gem_test! rake_file! gitignore! gem_file! rubocop_yml!].freeze
  GEM_MAP = { init_dirs: GEM_DIRS, init_files: GEM_FILES }.freeze

  # Rack
  RACK_DIRS = %w[app config test].freeze
  RACK_FILES = %w[rack_routes! rack_base_controller! rack_config_ru! gitignore! rack_app! rack_router! rack_initializers! rack_application! rack_gemfile!].freeze
  RACK_MAP = { init_dirs: RACK_DIRS, init_files: RACK_FILES }.freeze

  # Bot
  BOT_DIRS = %w[app bin config db test services].freeze
  BOT_FILES = %w[readme!].freeze
  BOT_MAP = { init_dirs: BOT_DIRS, init_files: BOT_FILES }.freeze

  # Dirs map
  AVAILABLE_COMMANDS = {
    COMMANDS[:init] => {
      COMMANDS[:gem] => GEM_MAP,
      COMMANDS[:rack] => RACK_MAP,
      COMMANDS[:bot] => BOT_MAP
    }
  }.freeze

  # Ping
  PONG = "PONG".freeze

  # Answers
  INIT_DIR_ERROR = "Init directory error".freeze
  APP_DETECTED = "Another one app exist".freeze
  FOLDER_EXIST = "folder exist:".freeze
  FILE_EXIST = "file already exist:".freeze
  WRONG_RESPONSE = "Wrong command".freeze
  WRONG_BASE_COMMAND = "Wrong init command".freeze
  EMPTY_NAME = "Project name is empty".freeze
  EMPTY_FIELD = "Empty field".freeze
  WRONG_TYPE = "Type is not required".freeze
  INIT_FAIL = "Init action fail:".freeze
  CREATE_FAILED = "Fail:".freeze
  CREATE_SUCCESS = "Success:".freeze
  COMMANDS_IS_NOT_AVAILABLE = "One of the commands has mistake".freeze

  # Text
  TAB = "\s\s".freeze
  DOUBLE_TAB = "\s\s\s\s".freeze

  class UserCommands
    include RocketApi::Validation
    attr_reader :init, :app, :name

    REGEXP_VALID = /[^0-9A-Za-z_-]/.freeze

    def initialize(init:, app:, name:)
      @init = add_field(init)
      @app = add_field(app)
      @name = add_field(name)
    rescue StandardError => e
      raise RocketApi::InitCommandsError, e.message
    end

    # @return [Boolean]
    def is_valid?
      presence_check(RocketApi::AVAILABLE_COMMANDS, @init)
      presence_check(RocketApi::AVAILABLE_COMMANDS[@init], @app)
      true
    rescue RocketApi::ValidationError
      false
    end

    private

    def add_field(filed)
      raise RocketApi::WRONG_TYPE unless filed.is_a?(String)
      raise RocketApi::EMPTY_FIELD if filed.nil?

      filed&.gsub(REGEXP_VALID, '')&.downcase
    end
  end
end
