module RocketApi
  # Valid input
  REGEXP_VALID = /[^0-9A-Za-z_-]/.freeze
  CHECK_APPS = %w[*.gemspec *.ru].freeze

  # Valid commands
  COMMANDS = { init: "init", gem: "gem", rack: "rack" }.freeze

  # Gem
  GEM_DIRS = %w[bin lib test].freeze
  GEM_FILES = %w[bin! gemspec! gems_main_file! gems_version! gem_test! rake_file! gitignore! gem_file! rubocop_yml!].freeze
  GEM_MAP = { init_dirs: GEM_DIRS, init_files: GEM_FILES }.freeze

  # Rack
  RACK_DIRS = %w[app config lib].freeze
  RACK_FILES = %w[].freeze
  RACK_MAP = { init_dirs: RACK_DIRS, init_files: RACK_FILES }.freeze

  # Dirs map
  AVAILABLE_COMMANDS = {
    COMMANDS[:init] => {
      COMMANDS[:gem] => GEM_MAP,
      COMMANDS[:rack] => RACK_MAP
    }
  }.freeze

  # Ping
  PONG = "PONG".freeze

  # Answers
  INIT_DIR_ERROR = "Init directory error".freeze
  APP_DETECTED = "another one app exist".freeze
  FOLDER_EXIST = "folder exist:".freeze
  FILE_EXIST = "file already exist:".freeze
  WRONG_RESPONSE = "Wrong command".freeze
  EMPTY_NAME = "Project name is empty".freeze
  INIT_FAIL = "Init action fail:".freeze
  CREATE_FAILED = "Create failed:".freeze
  CREATE_SUCCESS = "Successfully created:".freeze
end
