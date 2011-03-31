ENV['RAILS_ENV'] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(Rails)

require 'rspec/rails'
require 'ruby-debug'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
