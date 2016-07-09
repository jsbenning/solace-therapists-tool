class ClientsController < ApplicationController

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
        @client = Client.create( medical_record_id: params["medical_record_id"], first_name: params["first_name"], 
          last_name: params["last_name"], date_of_birth: params["date_of_birth"],
          phone: params["phone"] )
        erb :'clients/show_client'
      else
        redirect to '/'
      end
    end

end