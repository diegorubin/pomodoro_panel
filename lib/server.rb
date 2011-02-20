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

  get '/set_active/:login' do
    user = User.load params[:login]
    user.update('active',1)
  end

  get '/show/:login' do
    @user = User.load params[:login]
    haml :user
  end
  
end
