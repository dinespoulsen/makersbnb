ENV['RACK_ENV'] ||= 'development'

require_relative "./models/user"
require_relative "./models/space"
require_relative "./models/request"
require_relative "./data_mapper_setup.rb"
require 'sinatra/base'
require 'sinatra/flash'

class MakersBnb < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :sessions_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    current_user
    erb :"index"
  end

  get '/users/:id' do
    @current_user = User.first(id: params[:id])
    erb :'user/new'
  end

  get '/users/new' do
    current_user
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
    end
  end

  post '/sessions/terminate' do
    session[:user_id] = nil
    flash.keep[:notice] = "You have been logged out"
    redirect to('/sessions/new')
  end

  get '/spaces' do
    current_user
    @spaces = Space.all
    erb(:'space/index')
  end


  get '/spaces/new' do
    erb :'space/new'
  end

  post '/spaces' do
    @space = current_user.spaces.create(name: params[:name], price: params[:price],
            description: params[:description], available_from: params[:available_from],
            available_to: params[:available_to])
    erb :'space/space'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
