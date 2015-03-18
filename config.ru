require 'rubygems'
require 'sinatra'
require File.join(File.dirname(File.expand_path(__FILE__)),'lib/server')

DATABASE=File.join(File.dirname(File.expand_path(__FILE__)),'pomodoro.sqlite3')
Server.run!

