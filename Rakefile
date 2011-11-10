require 'rake/testtask'

desc "Run the skeleton_layout generator tests"
task :default => :test

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/*_test.rb']
  test.verbose = true
end
