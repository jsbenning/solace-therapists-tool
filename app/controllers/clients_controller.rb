class ClientsController < ApplicationController

  get '/clients' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      erb :'/'
    end
  end

  get '/clients/new' do
    if logged_in?
      @therapist = current_user
      erb :'clients/create_client'
    else
      erb :'/'
    end
  end

  post '/clients/new' do
    if logged_in?
      @therapist = current_user
      @client = @therapist.clients.build(params[:client])
      # @client = @theriapist.clients.build( 
      #   medical_record_id: params["medical_rec_id"], 
      #   first_name: params["first_name"], 
      #   last_name: params["last_name"], 
      #   date_of_birth: params["date_of_birth"], 
      #   address: params["address"],
      #   phone: params["phone"] )
      @client.record = Record.create(client_id: @client.id)
      erb :'clients/show_client'
    else
      erb :'/'
    end
  end

  get '/clients/:id' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      if !(@therapist.clients).include?(@client)
        erb :'error'
      else
      erb :'clients/show_client'
      end
    else
      erb :'/'
    end
  end

  get '/clients/:id/edit' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      if !(@therapist.clients).include?(@client)
        erb :'error'
      else
        erb :'clients/edit_client'
      end
    else
      erb :'error'
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

  get '/clients/:id/summary' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      erb :'clients/summary'
    else
      erb :'error'
    end
  end

  # /clients/:id/records/:record_id/edit
  get '/clients/:id/:record_name/edit' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])  
      record_form = params[:record_name]
      @record = @client.record
      erb :"#{record_form}/edit"
    else
      erb :'error'
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
      erb :'error'
    end
  end

  patch '/clients/:id/:record_name' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @record = @client.record
      if params[:record]
        (params[:record]).each do |param_key, param_value| #this method prevents empty fields from clearing values
          @record.attributes.each do |key, value|
            if key == param_key && param_value != "" && param_value != value
              @record.update((param_key.to_sym) => param_value)
            end
          end
        end
      end
      @record_form = (params[:record_name])
      erb :"#{@record_form}/show"
    else
      erb :'error'
    end
  end


  delete '/clients/:id/delete' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @client.record.delete
      @client.delete
      @clients = @therapist.clients
      erb :'therapists/show_therapist'
    else
      erb :'error'
    end
  end


end