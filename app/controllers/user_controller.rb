require 'pry'
class UserController < ApplicationController

  get '/home' do
    @user = User.find(session[:user_id])
    erb :'users/index'
  end

  get '/signup' do
    erb :'users/sign_up'
  end

  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id

    if user.save
      redirect '/home'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect '/home'
    else
      redirect '/login'
    end
  end

  post '/logout' do
    session.clear

    redirect '/'
  end
end