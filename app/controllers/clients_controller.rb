class ClientsController < ApplicationController

  get '/clients' do
    if logged_in?
      @therapist = current_user
      @clients = @therapist.clients
       redirect to "/therapists/#{@therapist.id}"
    else
      erb :welcome
    end
  end

  get '/clients/new' do
    if logged_in?
      @therapist = current_user
      erb :'clients/create_client'
    else
      erb :welcome
    end
  end

  post '/clients/new' do
    if logged_in?
      @therapist = current_user
      @client = @therapist.clients.build(params[:client])
      @client.save
      @client.record = Record.create(client_id: @client.id)
      redirect to "clients/#{@client.id}"
    else
      erb :welcome
    end
  end

  get '/clients/:id' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      if !(@therapist.clients).include?(@client)
        erb :error
      else
        erb :'clients/show_client'
      end
    else
      erb :welcome
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

  patch '/clients/:id' do
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      @client.update(params["client"])
      redirect to "clients/#{@client.id}"
    else
      erb :welcome
    end
  end

  get '/clients/:id/summary' do  # not a RESTful convention, but a convenient way to provide a quick summary
    if logged_in?
      @therapist = current_user
      @client = Client.find(params[:id])
      erb :'clients/summary'
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
      redirect to "therapists/#{@therapist.id}"
    else
      erb :'error'
    end
  end
end