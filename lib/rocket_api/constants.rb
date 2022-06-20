module RocketApi
  # Valid input
  REGEXP_VALID = /[^0-9A-Za-z_-]/.freeze

  # Dirs map
  GEM_PROJECTS_DIR = %w[bin lib test].freeze
  AVAILABLE_COMMANDS = {
    init: {
      gem: %w[init_gem_dir init_gem_files]
    }
  }.freeze

  # Ping
  PONG = "PONG".freeze

  # Answers
  INIT_DIR_ERROR = "Init directory error".freeze
  GEM_DETECTED = "another one gem exist".freeze
  FOLDER_EXIST = "folder exist:".freeze
  FILE_EXIST = "file already exist:".freeze
  WRONG_RESPONSE = "Wrong command".freeze
  EMPTY_NAME = "Project name is empty".freeze
  INIT_FAIL = "Init action fail:".freeze
  CREATE_FAILED = "Create failed:".freeze
  CREATE_SUCCESS = "Successfully created:".freeze
end
