module RocketApi
  module FilesCommands
    def self.init_config
      raise "file config/initialize already exist" if is_exist?("config/initialize.rb")

      out_file = File.new("config/initialize.rb", "w")
      out_file.puts("module Config\nclass Initialize;end\nend")
      out_file.close
      puts "config was initialized"
    rescue StandardError => e
      puts "config wasn't initialized: #{e.message}"
    end

    def self.is_exist?(dir_name)
      File.exist?(dir_name)
    end
  end
end
