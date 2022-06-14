module RocketApi
  class DirCommands
    def self.create_dir(dir_name)
      raise "folder exist: #{dir_name}" if is_exist?(dir_name)

      system 'mkdir', '-p', "#{dir_name}"
      puts "Successfully created: #{dir_name}"
    rescue StandardError => e
      puts "Directory: wasn't created: #{e.message}"
    end

    def self.is_exist?(dir_name)
      File.exist?(dir_name)
    end
  end
end
