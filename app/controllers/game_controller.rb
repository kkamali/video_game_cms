require 'pry'
class GameController < ApplicationController

  get '/games' do
    erb :'games/index'
  end

  get '/games/new' do
    erb :'games/new'
  end

  post '/games/new' do
    user = User.find(session[:user_id])
    user.games.create(params)

    redirect '/games'
  end
end