module RocketApi
  module Lib
    # @param [String] category
    def safe(category)
      yield
    rescue RocketApi::CreateDirError => e
      "#{RocketApi::INIT_DIR_ERROR} #{e.message}"
    rescue RocketApi::Error => e
      puts "[#{category}] #{e.message}"
    rescue StandardError => e
      puts "[#{category}] error: #{e.message}"
    end
  end
end
