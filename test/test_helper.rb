require 'minitest/autorun'
require 'rails'
require 'rails/generators'

require 'bundler'
Bundler.setup

TMP_ROOT = File.dirname(__FILE__) + "/tmp" unless defined?(TMP_ROOT)
