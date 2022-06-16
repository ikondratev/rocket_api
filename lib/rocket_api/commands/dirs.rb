module RocketApi
  module Commands
    module Dirs
      def create_repo(dirs)
        dirs.each { |dir| create_dir(dir) }
      end

      def self.create_dir(dir_name)
        raise "folder exist: #{dir_name}" if is_exist?(dir_name)

        system 'mkdir', '-p', "#{dir_name}"
        puts "Successfully created: #{dir_name}"
      rescue StandardError => e
        puts "Directory: wasn't created: #{e.message}"
      end
    end
  end
end
