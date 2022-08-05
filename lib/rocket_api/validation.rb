module RocketApi
  module Validation
    # @raise [RocketApi::ValidationError] error
    def check_possibility_to_init_dir
      raise RocketApi::APP_DETECTED unless RocketApi::CHECK_APPS.map { |p| Dir.glob(p) }.flatten.empty?
    rescue StandardError => e
      raise RocketApi::ValidationError, e.message
    end

    # @param [Hash] collection
    # @param [String] base_command
    # @raise [RocketApi::ValidationError]
    def presence_check(collection, base_command)
      raise RocketApi::WRONG_BASE_COMMAND unless collection.keys.include?(base_command)
    rescue StandardError => e
      raise RocketApi::ValidationError, e.message
    end
  end
end
