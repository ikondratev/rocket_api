module RocketApi
  module Commands
    module Dirs
      # ...
      # @param [Array] dirs
      def create_repo(dirs)
        dirs.each do |dir|
          create_dir(dir)
        rescue StandardError => e
          puts "#{CREATE_FAILED} #{e.message}"
        end
      end
      # ...
      # @param [String] dir_name
      # ...
      # @raise [StandardError]
      def create_dir(dir_name)
        raise "#{RocketApi::FOLDER_EXIST} #{dir_name}" if is_exist?(dir_name)

        system 'mkdir', '-p', "#{dir_name}"
        puts "#{RocketApi::CREATE_SUCCESS} #{dir_name}"
      rescue StandardError => e
        raise e, "#{dir_name} err: #{e.message}"
      end
    end
  end
end
