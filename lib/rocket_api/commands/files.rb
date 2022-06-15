module RocketApi
  module Commands
    module Files
      def is_exist?(dir_name)
        File.exist?(dir_name)
      end

      def class_name_camel(name)
        name.split('_').map(&:capitalize).join
      end

      def self.create_single_file(name, text)
        raise "file #{name} already exist" if is_exist?(name)

        out_file = File.new(name, "w")
        out_file.puts(text)
        out_file.close

        puts "#{name} was successfully initialized"
      rescue StandardError => e
        puts "#{name}  wasn't initialized: #{e.message}"
      end
    end
  end
end
