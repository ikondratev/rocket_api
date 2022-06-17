module RocketApi
  module Commands
    module Dirs
      def create_repo(dirs)
        dirs.each { |dir| create_dir(dir) }
      end

      def create_dir(dir_name)
        raise "#{RocketApi::FOLDER_EXIST} #{dir_name}" if is_exist?(dir_name)

        system 'mkdir', '-p', "#{dir_name}"
        puts "#{RocketApi::CREATE_SUCCESS} #{dir_name}"
      rescue StandardError => e
        puts "#{RocketApi::CREATE_FAILED} #{dir_name} err: #{e.message}"
      end
    end
  end
end
