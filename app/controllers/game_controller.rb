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
    binding.pry
    if params[:title].empty?
      redirect '/games/new'
    else
      user.games.create(params)

      redirect '/games'
    end
  end

  get '/games/:slug/edit' do
    if logged_in?
      @game = Game.find_by_slug(params[:slug])

      erb :'games/edit'
    else
      redirect '/login'
    end
  end

  post '/games/:slug/edit' do
    game = Game.find_by_slug(params[:slug])
    params.delete(:slug)
    game.update(params)

    redirect "/games/#{game.sluggify}"
  end

  get '/games/:slug' do
    @game = Game.find_by_slug(params[:slug])
    @session = session

    erb :'games/show'
  end

  post '/games/:slug/delete' do
    game = Game.find_by_slug(params[:slug])
    Game.delete(game.id)

    redirect '/games'
  end
end