module RocketApi
  module Commands
    module Files
      def is_exist?(dir_name)
        File.exist?(dir_name)
      end

      def class_name_camel(name)
        name.split('_').map(&:capitalize).join
      end

      def create_single_file(name, text, **options)
        raise "#{RocketApi::FILE_EXIST} #{name}" if is_exist?(name)

        out_file = File.new(name, "w")
        out_file.chmod(001) if options[:exe]
        out_file.puts(text)
        out_file.close

        puts "#{RocketApi::CREATE_SUCCESS} #{name}"
      rescue StandardError => e
        puts "#{RocketApi::CREATE_FAILED} #{name} err: #{e.message}"
      end
    end
  end
end
