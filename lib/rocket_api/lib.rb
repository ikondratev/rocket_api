module RocketApi
  module Lib
    # @param [String] category
    def safe(category)
      yield
    rescue RocketApi::CreateDirError => e
      puts "[#{category}] #{RocketApi::INIT_DIR_ERROR} #{e.message}"
    rescue RocketApi::Error, StandardError => e
      puts "[#{category}] #{e.message}"
    end
  end
end
