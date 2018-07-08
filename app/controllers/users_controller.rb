class UsersController < ApplicationController

  get "/signup" do
    login_status_display
    if logged_in?
      redirect "/"
    else
      erb :"/users/signup"
    end
  end

  post "/signup" do
    login_status_display
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user.save

    if @user.save
      session[:id] = @user.id
      redirect "/tweets"
    else
      redirect "/"
    end
  end

  get "/login" do
    login_status_display
    if logged_in?
      redirect "/"
    else
      erb :"/users/login"
    end
  end

  post "/login" do
    login_status_display
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tweets"
    else
      redirect "/"
    end
  end

  # get "/success" do
  #   erb :success
  # end
  #
  # get "/failure" do
  #   erb :failure
  # end

  get "/logout" do
    login_status_display
    session.clear
    # binding.pry
    redirect "/"
  end

  # get "/users/:id" do
  #   erb :"users/show"
  # end

end
