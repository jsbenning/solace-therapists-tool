require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'app/public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

  get '/register' do
    erb :'/therapists/create_therapist'
  end

  get '/login' do
    if logged_in?
      @therapist = current_user
      redirect to "/therapists/#{@therapist.id}"
    else  
      erb :login
    end
  end

  post '/login' do
    @therapist = Therapist.find_by(username: params[:username])
    if @therapist && @therapist.authenticate(params[:password])
      session[:therapist_id] = @therapist.id
      redirect to "/therapists/#{@therapist.id}"
    else
      redirect '/'  
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      erb :welcome
    end
  end

  get '/error' do
    erb :error
  end

  get '/not_found' do
    erb :not_found
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