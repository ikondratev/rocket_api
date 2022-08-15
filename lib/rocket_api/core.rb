module RocketApi
  module Core
    # @param [String] category
    def safe(category)
      yield
    rescue RocketApi::CreateDirError => e
      puts "[#{category}] #{RocketApi::INIT_DIR_ERROR} #{e.message}"
    rescue RocketApi::Error, StandardError => e
      puts "[#{category}] #{e.message}"
    end

    # @param [Array] avg_commands
    # @return [RocketApi::UserCommands]
    # @raise [RocketApi::ApplyCommandsError]
    def apply_commands(avg_commands)
      RocketApi::UserCommands.new(
        init: avg_commands[0],
        app: avg_commands[1],
        name: avg_commands[2]
      )
    rescue  RocketApi::Error, StandardError => e
      raise RocketApi::ApplyCommandsError, e.message
    end
  end
end
