# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'rdoc/task'

CLEAN.concat(['.rspec_status', 'Gemfile.lock', 'coverage', 'doc'])

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)
RDoc::Task.new(:rdoc) do |task|
  task.rdoc_files.include('README.md', 'LICENSE.txt', 'lib/')
  task.main = 'README.md'
  task.rdoc_dir = 'doc/html'
  task.title = 'Ruport::WikiTableFormatter'
end

desc 'Run all RSpec examples and collect coverage'
task :coverage do
  ENV['COVERAGE'] = 'yes'
  Rake::Task['spec'].execute
end

task default: :spec
