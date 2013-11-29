require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.name = "spec"
  t.libs << "lib"
  t.verbose = true
  t.pattern = 'spec/*_spec.rb'
end

desc "Run tests"
task :default => :spec
