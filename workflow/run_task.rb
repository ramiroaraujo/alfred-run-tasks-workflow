#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'bundle/bundler/setup'
require 'rake'

task = ARGV[0]

Rake.load_rakefile 'Rakefile'

Rake.application.invoke_task task
