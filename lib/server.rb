require 'sinatra'
require 'haml'
require 'time'

require File.join(File.dirname(__FILE__),'user')

class Server < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/../views'
  set :public, File.dirname(__FILE__) + '/../static'

  get '/' do
    @users = User.all
    haml :index
  end

  post '/start/:login' do
    user = User.load params[:login]
    now = Time.now
    user.update('time', "#{now.hour}:#{now.min}")
    user.update('active',1)
  end
  
  post '/stop/:login' do
    user = User.load params[:login]
    user.update('active',0)
  end

  get '/show/:login' do
    @user = User.load params[:login]

    if @user.activated?
      date = Time.parse @user.time
      result = Time.now - date
      left = 25*60 - result.to_i
      @left = "#{left/60}:#{left%60}"
      if result < 0
        @user.update('active',0)
      end
    end
    

    haml :user
  end
  
end
