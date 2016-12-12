require "./app/models/user.rb"

require 'sinatra/base'

class MakersBnb < Sinatra::Base
  get '/' do
    'Hello MakersBnb!'
  end

  get '/users/new' do
    erb :'user/new'
  end

  post '/users/new' do
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
