class TweetsController < ApplicationController

  get "/" do
    erb :'/tweets/homepage'
  end

  get "/tweets" do
    erb :"/tweets/index"
  end

  get "/tweets/new" do
    erb :"/tweets/new"
  end

  get "/tweets/:id" do
    erb :"/tweets/show"
  end

  get "/tweets/:id/edit" do
    erb :"/tweets/edit"
  end

  patch "/tweets/:id" do

  end

  delete "/tweets/:id/delete" do
    erb :"/tweets/delete"
  end

end
