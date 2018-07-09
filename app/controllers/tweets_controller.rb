class TweetsController < ApplicationController

  get "/" do
    login_status_display
    erb :"/index"
  end

  get "/tweets" do
    login_status_display
    if logged_in?
      erb :"/tweets/tweets"
    else
      redirect "/login"
    end
  end

  get "/tweets/new" do
    login_status_display
    if logged_in?
      erb :"/tweets/create_tweet"
    else
      redirect "/login"
    end
  end

  post "/tweets" do
    login_status_display
    @tweet = Tweet.create(content: params[:content])
    @tweet.user_id = current_user.id
    @tweet.save
    redirect "/tweets/#{@tweet.id}"
  end

  get "/tweets/:id" do
    login_status_display
    @tweet = Tweet.find_by(id: params[:id])
    if logged_in?
      erb :"/tweets/show_tweet"
    else
      redirect "/login"
    end
  end

  get "/tweets/:id/edit" do
    login_status_display
    @tweet = Tweet.find_by(id: params[:id])
    if logged_in? && @tweet.user == current_user
      erb :"/tweets/edit_tweet"
    elsif logged_in? && @tweet.user != current_user
      redirect "/tweets"
    else
      redirect "/login"
    end
  end

  patch "/tweets/:id" do
    login_status_display
    @tweet = Tweet.find_by(id: params[:id])
    # binding.pry
    @tweet.content = params[:content]
    @tweet.save
    redirect "/tweets/#{@tweet.id}"
  end

  delete "/tweets/:id/delete" do
    login_status_display
    @tweet = Tweet.find_by(id: params[:id])
    binding.pry
    if logged_in? && @tweet.user == current_user
      @tweet.destroy
      redirect "/tweets"
    elsif logged_in && @tweet.user != current_user
      redirect "/tweets"
    else
      redirect "/login"
    end

  end

end
