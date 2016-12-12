ENV['RACK_ENV'] ||= 'development'

require_relative "./models/user"
require 'sinatra/base'
require 'sinatra/flash'

class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    "MakersBnB"
  end

  get '/users/:id' do
    @user = User.first(id: params[:id])
    erb :'user/profile'

  get '/users/new' do
    erb :'user/new'
  end

  post '/users/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end
  
  get '/sessions/new' do
    erb :'sessions/new'
  end
  
  post '/sessions/new' do
    user = User.first(email: params[:email])
    if user
      if user.authenticated?(params[:password])
        session[:user_id] = user.id
        redirect to("/users/#{user.id}")
      else
        flash.now[:notice] = 'Wrong password'
        redirect '/'
      end
    else
      flash.now[:notice] = 'User does not exist'
      redirect '/'
   helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
