class TweetsController < ApplicationController

  get "/" do
    login_status_display
    # binding.pry
    erb :"/index"
  end

  get "/tweets" do
    login_status_display
    erb :"/tweets/tweets"
  end

  get "/tweets/new" do
    login_status_display
    if logged_in?
      erb :"/tweets/create_tweet"
    else
    end
      redirect "/login"
  end

  post "/tweets" do
    login_status_display
    @tweet = Tweet.create(content: params[:content], user_id: params[:user_id])
    redirect "/tweets/#{@tweet.id}"
  end

  get "/tweets/:id" do
    login_status_display
    @tweet = Tweet.find_by(params[:id])
    erb :"/tweets/show_tweet"
  end

  get "/tweets/:id/edit" do
    login_status_display
    erb :"/tweets/edit_tweet"
  end

  patch "/tweets/:id" do
    login_status_display
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.update(params)
  end

  delete "/tweets/:id/delete" do
    login_status_display
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
  end

end
