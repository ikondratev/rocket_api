module RocketApi
  # Dirs map
  GEM_PROJECTS_DIR = %w[bin lib test].freeze

  # Ping
  PONG = "PONG".freeze

  # Commands
  INIT = "init".freeze
  BASE = "base".freeze
  GEM = "gem".freeze

  # Answers
  INIT_DIR_ERROR = "Init directory error".freeze
  GEM_DETECTED = "another one gem exist".freeze
  FOLDER_EXIST = "folder exist:".freeze
  FILE_EXIST = "file already exist:".freeze
  WRONG_ANSWER = "Wrong command".freeze
  EMPTY_NAME = "Project name is empty".freeze
  INIT_FAIL = "Init action fail:".freeze
  CREATE_FAILED = "Create failed:".freeze
  CREATE_SUCCESS = "Successfully created:".freeze
end
