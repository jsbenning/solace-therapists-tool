
class TherapistsController < ApplicationController

  post '/therapists/new' do
    @therapist = Therapist.create(username: params["username"], 
    password: params["password"], first_name: params["first_name"], 
    last_name: params["last_name"], license_type: params["license_type"],
    license_number: params["license_number"])
    if @therapist.save || logged_in?
      session[:therapist_id] = @therapist.id
      @clients = @therapist.clients
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
      erb :'index'
    end
  end

  get '/therapists/:id' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      erb :'index'
    end
  end

  patch '/therapists/:id/edit' do
    if logged_in?
      @therapist = current_user
      redirect to "/therapists/#{@therapist.id}"
    else
      erb :'index'
    end
  end
end