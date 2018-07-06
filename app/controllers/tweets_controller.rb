class TweetsController < ApplicationController

  get "/" do
    erb :"/index"
  end

  get "/tweets" do
    erb :"/tweets/tweets"
  end

  get "/tweets/new" do
    erb :"/tweets/create_tweet"
  end

  post "/tweets" do
    @tweet = Tweet.create(content: params[:content], user_id: params[:user_id])
    redirect "/tweets/#{@tweet.id}"
  end

  get "/tweets/:id" do
    @tweet = Tweet.find_by(params[:id])
    erb :"/tweets/show_tweet"
  end

  get "/tweets/:id/edit" do
    erb :"/tweets/edit_tweet"
  end

  patch "/tweets/:id" do
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.update(params)
  end

  delete "/tweets/:id/delete" do
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
  end

end
