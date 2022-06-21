require 'rubygems'
require 'rake'

desc "Run spec"
task default: %i[spec rubocop]

require "bundler/gem_tasks"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new do |task|
  task.fail_on_error = true
  task.requires << 'rubocop-rake'
end