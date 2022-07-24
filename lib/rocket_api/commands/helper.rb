module RocketApi
  module Commands
    module Helper
      # @param [String] name
      def readme!(name)
        create_single_file("README.md", readme_text(name))
      end

      # @param [String] name
      def bin!(name)
        create_single_file("bin/#{name}", "", exe: true)
      end

      # @param [String] _name
      def gitignore!(_name)
        create_single_file(".gitignore", gitignore_text)
      end

      # @param [String] _name
      def rake_file!(_name)
        create_single_file("Rakefile", rake_text)
      end

      # @param [String] _name
      def gem_file!(_name)
        create_single_file("Gemfile", gemfile_text)
      end
    end
  end
end
