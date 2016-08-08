class TherapistsController < ApplicationController

  get '/therapists/new' do 
    if logged_in? 
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      redirect to '/register'
    end
  end
        

  post '/therapists/new' do
    @therapist = Therapist.create(username: params["username"], 
    password: params["password"], email: params["email"], first_name: params["first_name"], 
    last_name: params["last_name"], license_type: params["license_type"],
    license_number: params["license_number"])
    if @therapist.save || logged_in?
      session[:therapist_id] = @therapist.id
      erb :'therapists/show_therapist'
    else
      redirect to '/register'
    end
  end

  get '/therapists/:id/edit' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/edit_therapist'
    else
      erb :'error'
    end
  end

  get '/therapists/:id' do
    if logged_in? && current_user.id == params[:id].to_i
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      erb :'error'
    end
  end

  patch '/therapists/:id/edit' do
    if logged_in?
      @therapist = current_user
      @therapist.update(params["therapist"])
      redirect to "/therapists/#{@therapist.id}"
    else
      redirect to '/'
    end
  end
end
