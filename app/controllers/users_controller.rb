class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    @user = User.new(username: params[:username], password: params[:password])
    @user.save
    session[:id] = @user.id

    if @user.save
      redirect "/tweets/index"
    else
      redirect "/failure"
    end
  end

  get "/login" do
    if self.is_logged_in?
      redirect "/tweets/index"
    else
      erb :"/users/login"
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tweets"
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

  get "/users/:id" do
    erb :"users/show"
  end

end
