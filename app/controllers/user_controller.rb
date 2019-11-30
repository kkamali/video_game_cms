class UserController < ApplicationController

  get '/signup' do
    erb :'users/sign_up'
  end

  post '/signup' do
    user = User.new(params)
    session[:user_id] = user.id

    if user.save
      erb :'users/index'
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

      erb :'users/index'
    else
      redirect '/login'
    end
  end
end