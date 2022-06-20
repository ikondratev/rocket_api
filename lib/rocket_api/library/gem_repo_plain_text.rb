module RocketApi
  module Library
    module GemRepoPlainText
      def gitignore_text
        ".idea/\nGemfile.lock\n*.gem".freeze
      end

      def plain_version_text(module_name)
        "module #{module_name}\n\tVERSION = \"0.0.1\".freeze\nend"
      end

      def plain_gemspec_text(name, module_name)
        ["lib = File.expand_path(\"lib\", __dir__)",
         "$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)\n",
         "require 'English'",
         "require '#{name}/version'\n",
         "Gem::Specification.new do |s|",
         "\ts.specification_version = 2 if s.respond_to? :specification_version=",
         "\tif s.respond_to? :required_rubygems_version=",
         "\t\ts.required_rubygems_version = Gem::Requirement.new('>= 0')",
         "\tend",
         "\ts.rubygems_version = 'RUBY_VERSION'",
         "\ts.required_ruby_version = 'RUBY_VERSION'",
         "\ts.name = '#{name}'",
         "\ts.version = #{module_name}::VERSION",
         "\ts.executables << '#{name}'",
         "\ts.summary = 'PUT_SUMMARY'",
         "\ts.description = 'PUT_DESCRIPTION'",
         "\ts.authors = ['AUTHOR']",
         "\ts.email = 'AUTHOR_MAIL'",
         "\ts.homepage = 'https://github.com/...'",
         "\ts.files = `git ls-files`.split($RS)",
         "end"].join("\n")
      end

      def plain_gem_test_version_text(name, module_name)
        ["require 'minitest/autorun'",
         "require '#{name}/version'\n",
         "class TestVersion < Minitest::Test",
         "\tinclude #{module_name}\n",
         "\tdef test_ping",
         "\t\tassert_equal(\"0.0.1\", #{module_name}::VERSION)",
         "\tend",
         "end"].join("\n")
      end
    end
  end
end
