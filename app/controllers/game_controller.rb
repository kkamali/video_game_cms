require 'pry'
class GameController < ApplicationController

  get '/games' do
    @games = Game.all

    erb :'games/index'
  end

  get '/games/new' do
    if logged_in?
      erb :'games/new'
    else
      redirect '/login'
    end
  end

  post '/games/new' do
    user = current_user
    user.games.create(params)

    redirect '/games'
  end

  get '/games/:id/edit' do
    if logged_in?
      @game = Game.find(params[:id])

      erb :'games/edit'
    else
      redirect '/login'
    end
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