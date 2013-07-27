#!/usr/bin/env ruby
Signal.trap("INT") { exit 1 } #

require 'access_lint'
require 'access_lint/cli'

AccessLint::CLI.start(ARGV)
