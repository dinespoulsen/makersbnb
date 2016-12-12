require "./app/models/user.rb"
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
  end

  get '/users/new' do
    erb :'user/new'
  end

  post '/users/new' do
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    p user = User.first(email: params[:email])
    p params[:password]
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
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
