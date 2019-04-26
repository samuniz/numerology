require 'pathname'
require 'pg'
require 'logger'
require 'yaml'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require "sinatra/activerecord"

require 'erb'

APP_ROOT = Pathname.new(File.expand_path(File.dirname(__FILE__)))

Dir[APP_ROOT.join('app', 'controllers', '*.rb')].sort{|a,b| !a.include?("index") ? 1 : -1 <=> b.include?("index") ? -1 : 1}.each { |f| require f }

Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |f| require f }

ActiveRecord::Base.logger = Logger.new(STDOUT)

Dir[APP_ROOT.join('app/models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

helpers ApplicationHelper