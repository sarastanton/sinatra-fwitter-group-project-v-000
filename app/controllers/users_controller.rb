class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    @user = User.new(username: params[:username], password: params[:password])
    @user.save
    session[:id] = @user.id

    if user.save
      redirect "/login"
    else
      redirect "/failure"
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/success"
    else
      redirect "/failure"
    end
  end

  get "/success" do
    erb :success
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
  end

end
