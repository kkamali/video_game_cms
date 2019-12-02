require 'pry'
class GameController < ApplicationController

  get '/games' do
    erb :'games/index'
  end

  get '/games/new' do
    erb :'video_games/new'
  end

  post '/games/new' do
    binding.pry
  end
end