module RocketApi
  module Library
    module GemRepoPlainText
      def gitignore_text
        ".idea/\nGemfile.lock\n*.gem".freeze
      end

      # @param [String] module_name
      # @return [String] text
      def plain_version_text(module_name)
        "module #{module_name}\n\tVERSION = \"0.0.1\".freeze\nend"
      end

      # @param [String] name
      # @param [String] module_name
      # @return [String] text
      def plain_gemspec_text(name, module_name)
        ["lib = File.expand_path(\"lib\", __dir__)",
         "$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)\n",
         "require 'English'",
         "require '#{name}/version'\n",
         "Gem::Specification.new do |s|",
         "\s\ss.specification_version = 2 if s.respond_to? :specification_version=",
         "\s\sif s.respond_to? :required_rubygems_version=",
         "\s\s\s\ss.required_rubygems_version = Gem::Requirement.new('>= 0')",
         "\s\send",
         "\s\ss.rubygems_version = 'RUBY_VERSION'",
         "\s\ss.required_ruby_version = 'RUBY_VERSION'",
         "\s\ss.name = '#{name}'",
         "\s\ss.version = #{module_name}::VERSION",
         "\s\ss.executables << '#{name}'",
         "\s\ss.summary = 'PUT_SUMMARY'",
         "\s\ss.description = 'PUT_DESCRIPTION'",
         "\s\ss.authors = ['AUTHOR']",
         "\s\ss.email = 'AUTHOR_MAIL'",
         "\s\ss.homepage = 'https://github.com/...'",
         "\s\ss.files = `git ls-files`.split($RS)",
         "\s\ss.add_dependency \"rubocop\"",
         "\s\ss.add_dependency \"rubocop-rake\"",
         "end"].join("\n")
      end

      # @param [String] name
      # @param [String] module_name
      # @return [String] text
      def plain_gem_test_version_text(name, module_name)
        ["require 'minitest/autorun'",
         "require '#{name}/version'\n",
         "class TestVersion < Minitest::Test",
         "\s\sinclude #{module_name}\n",
         "\s\sdef test_ping",
         "\s\s\s\sassert_equal(\"0.0.1\", #{module_name}::VERSION)",
         "\s\send",
         "end"].join("\n")
      end

      # @return [String] text
      def gemfile_text
        ["source 'https://rubygems.org/'",
         "ruby 'RUBY_VERSION'",
         "gemspec"].join("\n")
      end

      # @param [String] name
      # @return [String] text
      def plain_rubocop_yml_text(name)
        ["AllCops:",
         "\s\sExclude:",
         "\s\s\s\s- Gemfile",
         "\s\s\s\s- test/*",
         "\s\s\s\s- Rakefile",
         "\s\s\s\s- #{name}.gemspec",
         "\s\s\s\s- bin/*"].join("\n")
      end
    end
  end
end
