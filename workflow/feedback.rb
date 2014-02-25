#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'bundle/bundler/setup'
require 'alfred'
require 'rake'

Alfred.with_friendly_error do |alfred|

  fb = alfred.feedback

  Rake.load_rakefile 'Rakefile'
  tasks = Rake.application.tasks

  if tasks.length > 0
    tasks.each do |task|
      fb.add_item({
          :uid => task.name,
          :title => "run: #{task.comment}",
          :subtitle => task.full_comment.split("\n").join('. '),
          :arg => task.name,
          :valid => 'yes',
      })
    end
  else
    fb.add_item({
        :uid => '',
        :title => 'No Tasks to run',
        :subtitle => 'No Tasks were found in the Rakefile',
        :valid => 'no',
    })

  end

  puts fb.to_xml()
end