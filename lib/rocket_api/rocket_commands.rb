require "rocket_api/commands/files"
require "rocket_api/commands/dirs"
require "rocket_api/commands/gems_dir"
require "rocket_api/commands/helper"
require "rocket_api/library/gem_repo_plain_text"
require "rocket_api/library/helper_plain_text"

module RocketApi
  class RocketCommands
    extend RocketApi::Commands::Files
    extend RocketApi::Commands::Dirs
    extend RocketApi::Commands::GemsDir
    extend RocketApi::Commands::Helper
    extend RocketApi::Library::GemRepoPlainText
    extend RocketApi::Library::HelperPlainText

    # @param [Hah] options
    # ...
    # @raise [RocketApi::CreateDirError]
    def self.init_gem_dir(**_options)
      raise GEM_DETECTED unless Dir.glob("*.gemspec").empty?

      create_repo(RocketApi::GEM_PROJECTS_DIR)
    rescue StandardError => e
      raise RocketApi::CreateDirError,
            "#{RocketApi::CREATE_FAILED} #{e.message}"
    end

    # @param [Hash] options
    # ...
    # @raise [RocketApi::InitFilesError] error
    def self.init_gem_files(**options)
      raise RocketApi::EMPTY_NAME if options[:project_name].nil?

      project_name = options[:project_name]
      RocketApi::GEM_COMMANDS.each { |command| send(command, project_name) }
    rescue StandardError => e
      raise RocketApi::InitFilesError,
            "#{RocketApi::INIT_FAIL} #{e.message}"
    end
  end
end
