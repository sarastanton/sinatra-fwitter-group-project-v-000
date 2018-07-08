class TweetsController < ApplicationController

  get "/" do
    login_status_display
    # binding.pry
    erb :"/index"
  end

  get "/tweets" do
    login_status_display
    @user = current_user
    erb :"/tweets/tweets"
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
    binding.pry
    redirect "/tweets/#{@tweet.id}"
  end

  get "/tweets/:id" do
    login_status_display
    @tweet = Tweet.find_by(id: params[:id])
    binding.pry
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
