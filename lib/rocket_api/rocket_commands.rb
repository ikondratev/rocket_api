require './lib/rocket_api/constants'
require './lib/rocket_api/commands/files'
require './lib/rocket_api/commands/dirs'
require './lib/rocket_api/library/gem_repo_plain_text'
require './lib/rocket_api/commands/gems_dir'

module RocketApi
  class RocketCommands
    extend RocketApi::Commands::Files
    extend RocketApi::Commands::Dirs
    extend RocketApi::Commands::GemsDir
    extend RocketApi::Library::GemRepoPlainText
    # ...
    # @raise [RocketApi::CreateDirError]
    def self.init_gem_dir
      create_repo(RocketApi::GEM_PROJECTS_DIR)
    rescue StandardError => e
      raise RocketApi::CreateDirError,
            "#{RocketApi::CREATE_FAILED} #{e.message}"
    end
    # ...
    # @param [String] project_name
    # ...
    # @raise [RocketApi::InitFilesError] error
    def self.init_gem_files(project_name)
      raise RocketApi::EMPTY_NAME if project_name.nil?

      init_bin!(project_name)
      init_gemspec!(project_name)
      init_gems_main_file!(project_name)
      init_gems_version!(project_name)
      init_gitignore!
    rescue StandardError => e
      raise RocketApi::InitFilesError,
            "#{RocketApi::INIT_FAIL} #{e.message}"
    end

    def self.init_bin!(name)
      dir_name = "bin/#{name}"
      create_single_file(
        dir_name,
        "",
        exe: true
      )
    end

    def self.init_gitignore!
      file_name = ".gitignore"
      create_single_file(
        file_name,
        gitignore_text
      )
    end
  end
end
