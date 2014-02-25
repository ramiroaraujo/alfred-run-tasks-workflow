#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'bundle/bundler/setup'
require 'rake'
require 'stringio'

task = ARGV[0]

# capture buffer from tasks
buffer = StringIO.new
$stdout = buffer

# load rakefile and run task
# @todo check for way of adding parameters, maybe by colon? as in tasks some:parameter, where some is the filter and everything after the colon are arguments
Rake.load_rakefile 'Rakefile'
Rake.application.invoke_task task

# restore normal output buffering
$stdout = STDOUT

# prints task name for notification
print Rake.application.tasks.detect { |t| t.name == task }.comment.split("\n")[0]