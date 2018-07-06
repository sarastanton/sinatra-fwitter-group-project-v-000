require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  helpers do
    def current_user(session)
      User.find_by(id: session[:user_id])
    end

    def logged_in?(session)
      session[:user_id] != []
    end
  end

end
