class ClientsController < ApplicationController

  get '/clients' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      redirect to '/'
    end
  end

  get '/clients/new' do
    if logged_in?
      @therapist = current_user
      erb :'clients/create_client'
    else
      redirect to '/'
    end
  end

  post '/clients/new' do
    if logged_in?
      @therapist = current_user
      @client = Client.create( therapist_id: @therapist.id, 
        medical_record_id: params["medical_record_id"], 
        first_name: params["first_name"], 
        last_name: params["last_name"], 
        date_of_birth: params["date_of_birth"], 
        address: params["address"],
        phone: params["phone"] )
      @client.record = Record.create(client_id: @client.id)
      erb :'clients/show_client'
    else
      redirect to '/'
    end
  end

  get '/clients/:id' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      erb :'clients/show_client'
    else
      redirect to '/'
    end
  end

  get '/clients/:id/edit' do
    if logged_in?
      @therapist = current_user
      @therapists = Therapist.all
      @client = Client.find(params[:id])
      erb :'clients/edit_client'
    else
      redirect to '/'
    end
  end

  patch '/clients/:id/edit' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @client.update(params["client"])
      redirect to "/clients/#{@client.id}"
    else
      erb :'index'
    end
  end

  delete '/clients/:id/edit' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @client.record.delete
      @client.delete
      redirect to "/clients/#{@client.id}"
    else
      erb :'index'
    end
  end

  get '/clients/:id/summary' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      erb :'clients/summary'
    else
      redirect to '/'
    end
  end





  get '/clients/:id/:record_name/edit' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      record_form = params[:record_name]
      @record = @client.record
      erb :"#{record_form}/edit"
    else
      erb :'index'
    end
  end

  get '/clients/:id/:record_name' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @record_form = params[:record_name]
      @record = @client.record
      erb :"#{@record_form}/show"
    else
      erb :'index'
    end
  end

  patch '/clients/:id/:record_name' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @record = @client.record
      if params[:record] 
        @record.update(params[:record])
      end
      @record_form = (params[:record_name])
      erb :"#{@record_form}/show"
    else
      erb :'index'
    end
  end

  delete '/clients/:id/delete' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @client.record.delete
      @client.delete
      erb :'therapists/show_therapist'
    else
      erb :'index'
    end
  end


end