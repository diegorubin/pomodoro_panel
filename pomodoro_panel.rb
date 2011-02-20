require 'rubygems'
require 'lib/server'

DATABASE=File.join(File.dirname(File.expand_path(__FILE__)),'pomodoro.sqlite3')
puts "using database #{DATABASE}"
Server.run!
