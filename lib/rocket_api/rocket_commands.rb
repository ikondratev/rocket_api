require "rocket_api/commands/files"
require "rocket_api/commands/dirs"
require "rocket_api/commands/gems_dir"
require "rocket_api/commands/helper"
require "rocket_api/commands/rack_dir"
require "rocket_api/library/gem_repo_plain_text"
require "rocket_api/library/rack_repo_plain_text"
require "rocket_api/library/helper_plain_text"

module RocketApi
  class RocketCommands
    extend RocketApi::Commands::Files
    extend RocketApi::Commands::Dirs
    extend RocketApi::Commands::Helper
    extend RocketApi::Commands::GemsDir
    extend RocketApi::Commands::RackDir
    extend RocketApi::Library::HelperPlainText
    extend RocketApi::Library::GemRepoPlainText
    extend RocketApi::Library::RackRepoPlainText

    # @param [Hah] options
    # @raise [RocketApi::CreateDirError]
    def self.init_dirs(**options)
      create_repo(options[:collection])
    rescue StandardError => e
      raise RocketApi::CreateDirError, "#{RocketApi::CREATE_FAILED} #{e.message}"
    end

    # @param [Hash] options
    # @raise [RocketApi::InitFilesError] error
    def self.init_files(**options)
      project_name = options[:project_name]
      options[:collection].each { |command| send(command, project_name) }
    rescue StandardError => e
      raise RocketApi::InitFilesError, "#{RocketApi::INIT_FAIL} #{e.message}"
    end
  end
end
