$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "dicemypass"
require "minitest/autorun"

# add default progress bar to reports
require 'minitest/reporters'

Minitest::Reporters.use!