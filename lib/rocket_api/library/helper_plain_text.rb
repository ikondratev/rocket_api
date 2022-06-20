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
         "\ttest.libs << 'test'",
         "end\n",
         "require 'rubocop/rake_task'",
         "RuboCop::RakeTask.new do |task|",
         "\ttask.fail_on_error = true",
         "\ttask.requires << 'rubocop-rake'",
         "end"].join("\n")
      end
    end
  end
end
