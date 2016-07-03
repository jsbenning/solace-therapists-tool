require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

    post "/signup" do
    @user = User.create(username: params["username"], 
    password: params["password"], email: params["email"])
    if @user.save || logged_in?
      session[:user_id] = @user.id
      redirect to "/tweets"
    else
      redirect to '/signup'
    end
  end

  get "/login" do
    if logged_in?
      @user = current_user
      redirect to "/tweets"
    else  
      erb :"users/login"
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/tweets"
    else
      redirect to '/'  #homepage
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end