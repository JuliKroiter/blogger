# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Deployment
require 'capistrano/rake'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails'

set :rvm_type, :user
set :rvm_ruby_version, '2.2.1'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
