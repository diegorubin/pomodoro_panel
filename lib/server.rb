require 'sinatra'
require 'haml'

class Server < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/../views'
  set :public, File.dirname(__FILE__) + '/../static'

  get '/' do
    haml :index
  end
  
end
