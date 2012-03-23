# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "tagregate"
  gem.homepage = "http://github.com/howaboutwe/tagregate"
  gem.license = "MIT"
  gem.summary = %Q{Tagregate your app's cucumber tags}
  gem.description = %Q{Tagregate adds helpful Rake tasks to Ruby on Rails applications that use Cucumber tags.}
  gem.email = "dev@howaboutwe.com"
  gem.authors = ["Bryan Woods", "Matt Vermaak"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec
