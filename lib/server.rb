require 'sinatra'
require 'haml'
require File.join(File.dirname(__FILE__),'user')

class Server < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/../views'
  set :public, File.dirname(__FILE__) + '/../static'

  get '/' do
    @users = User.all
    haml :index
  end
  
end
