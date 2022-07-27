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
         "#{TAB}s.specification_version = 2 if s.respond_to? :specification_version=",
         "#{TAB}if s.respond_to? :required_rubygems_version=",
         "#{DOUBLE_TAB}s.required_rubygems_version = Gem::Requirement.new('>= 0')",
         "#{TAB}end",
         "#{TAB}s.rubygems_version = 'RUBY_VERSION'",
         "#{TAB}s.required_ruby_version = 'RUBY_VERSION'",
         "#{TAB}s.name = '#{name}'",
         "#{TAB}s.version = #{module_name}::VERSION",
         "#{TAB}s.executables << '#{name}'",
         "#{TAB}s.summary = 'PUT_SUMMARY'",
         "#{TAB}s.description = 'PUT_DESCRIPTION'",
         "#{TAB}s.authors = ['AUTHOR']",
         "#{TAB}s.email = 'AUTHOR_MAIL'",
         "#{TAB}s.homepage = 'https://github.com/...'",
         "#{TAB}s.files = `git ls-files`.split($RS)",
         "#{TAB}s.add_dependency \"rubocop\"",
         "#{TAB}s.add_dependency \"rubocop-rake\"",
         "end"].join("\n")
      end

      # @param [String] name
      # @param [String] module_name
      # @return [String] text
      def plain_gem_test_version_text(name, module_name)
        ["require 'minitest/autorun'",
         "require '#{name}/version'\n",
         "class TestVersion < Minitest::Test",
         "#{TAB}include #{module_name}\n",
         "#{TAB}def test_ping",
         "#{DOUBLE_TAB}assert_equal(\"0.0.1\", #{module_name}::VERSION)",
         "#{TAB}end",
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
         "#{TAB}Exclude:",
         "#{DOUBLE_TAB}- Gemfile",
         "#{DOUBLE_TAB}- test/*",
         "#{DOUBLE_TAB}- Rakefile",
         "#{DOUBLE_TAB}- #{name}.gemspec",
         "#{DOUBLE_TAB}- bin/*"].join("\n")
      end
    end
  end
end
