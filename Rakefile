# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

CLEAN.concat(['.rspec_status', 'Gemfile.lock', 'coverage'])

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)

desc 'Run all RSpec examples and collect coverage'
task :coverage do
  ENV['COVERAGE'] = true
  Rake::Task['spec'].execute
end

task :default => :spec
