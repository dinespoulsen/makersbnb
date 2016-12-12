ENV['RACK_ENV'] ||= 'development'

require_relative "./models/user"
require 'sinatra/base'

class MakersBnb < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    current_user
    erb :index
  end

  get '/users/new' do
    erb :'user/new'
  end

  post '/users/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
