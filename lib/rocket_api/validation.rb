module RocketApi
  module Validation
    # @parma [Array<String>] commands
    # @raise [RocketApi::ValidationError] error
    def validate_commands(*commands)
      raise RocketApi::WRONG_RESPONSE if commands.any?(&:nil?)
    rescue StandardError => e
      raise RocketApi::ValidationError, e.message
    end

    # @raise [RocketApi::ValidationError] error
    def available_to_init?
      raise RocketApi::APP_DETECTED unless RocketApi::CHECK_APPS.map { |p| Dir.glob(p) }.flatten.empty?
    rescue StandardError => e
      raise RocketApi::ValidationError, e.message
    end
  end
end
