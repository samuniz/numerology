require 'rake'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require 'active_support'
require 'active_support/core_ext'
require 'rspec/core/rake_task'

namespace :db do
  task :load_config do
    require "./app"
  end  
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r ./app"
end

desc "Run the specs"
task 'specs' do
  exec "rspec spec"
end
