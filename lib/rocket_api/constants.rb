module RocketApi
  # Valid input
  REGEXP_VALID = /[^0-9A-Za-z_-]/.freeze
  CHECK_APPS = %w[*.gemspec *.ru].freeze

  # Dirs map
  GEM_DIRS = %w[bin lib test].freeze
  GEM_FILES = %w[bin! gemspec! gems_main_file! gems_version! gem_test! rake_file! gitignore! gem_file! rubocop_yml!].freeze
  RACK_DIRS = %w[app config lib].freeze
  AVAILABLE_COMMANDS = {
    init: {
      gem: {
        init_dirs: GEM_DIRS,
        init_files: GEM_FILES
      },
      rack_app: {
        init_dirs: RACK_DIRS,
        init_files: []
      }
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
