require './config/environment'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'assets'
    set :views, 'app/views'
  end

  get '/' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      erb :"index"
    end
  end

  get '/register' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
        erb :'therapists/show_therapist'
    else 
      erb :"therapists/create_therapist" 
    end
  end

  get '/login' do
    if logged_in?
      @therapist = current_user
      erb :'therapists/show_therapist'
    else  
      erb :'login'
    end
  end

  post '/login' do
    @therapist = Therapist.find_by(username: params[:username])
    if @therapist && @therapist.authenticate(params[:password])
      session[:therapist_id] = @therapist.id
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      redirect to '/'  #index page
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      erb :'error'
    end
  end

  helpers do

    def logged_in?
      !!session[:therapist_id]
    end

    def current_user
      Therapist.find(session[:therapist_id])
    end
    
  end
end