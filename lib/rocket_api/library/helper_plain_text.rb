module RocketApi
  module Library
    module HelperPlainText
      def rake_text
        ["require 'rubygems'",
         "require 'rake'\n",
         "desc \"Run spec\"",
         "task default: %i[test rubocop]\n",
         "require 'rake/testtask'",
         "Rake::TestTask.new do |test|",
         "#{TAB}test.libs << 'test'",
         "end\n",
         "require 'rubocop/rake_task'",
         "RuboCop::RakeTask.new do |task|",
         "#{TAB}task.fail_on_error = true",
         "#{TAB}task.requires << 'rubocop-rake'",
         "end"].join("\n")
      end

      def readme_text(project_name)
        ["# #{project_name}",
         "```sh",
         "Add Product Version",
         "```",
         "```sh",
         "Add description",
         "```"].join("\n")
      end
    end
  end
end
