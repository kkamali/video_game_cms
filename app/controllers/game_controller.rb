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

  get '/games/:id/edit' do
    @game = Game.find(params[:id])

    erb :'games/edit'
  end

  post '/games/:id/edit' do
    game = Game.find(params[:id])
    game.update(params)

    redirect "/games/#{game.id}"
  end

  get '/games/:id' do
    @game = Game.find(params[:id])

    erb :'games/show'
  end
end