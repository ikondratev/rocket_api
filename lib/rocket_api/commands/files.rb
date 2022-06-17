module RocketApi
  module Commands
    module Files
      # ...
      # @param [String] dir_name
      def is_exist?(dir_name)
        File.exist?(dir_name)
      end
      # ...
      # @param [String] name
      def class_name_camel(name)
        name.split('_').map(&:capitalize).join
      end
      # ...
      # @param [String] name
      # @param [String] text
      # @param [Hash] options
      # ...
      # @raise [StandardError] error
      def create_single_file(name, text, **options)
        raise "#{RocketApi::FILE_EXIST} #{name}" if is_exist?(name)

        out_file = File.new(name, "w")
        out_file.chmod(001) if options[:exe]
        out_file.puts(text)
        out_file.close

        puts "#{RocketApi::CREATE_SUCCESS} #{name}"
      rescue StandardError => e
        raise e, "#{name} err: #{e.message}"
      end
    end
  end
end
